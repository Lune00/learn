<template>
  <va-dropdown
    :closeOnAnchorClick="false"
    :disabled="disabled"
    :fixed="fixed"
    :max-height="maxHeight"
    :position="position"
    :style="{width}"
    boundaryBody
    class="va-select__dropdown"
    keepAnchorWidth
    ref="dropdown"
  >
    <va-input
      :placeholder="placeholder"
      class="va-select__input"
      ref="search"
      removable
      v-if="searchable"
      v-model="search"
    />
    <ul
      :style="optionsListStyle"
      class="va-select__option-list"
    >
      <li
        :class="getOptionClass(option)"
        :key="getKey(option)"
        :style="getOptionStyle(option)"
        @click.stop="selectOption(option)"
        @mouseleave="updateHoveredOption(null)"
        @mouseover="updateHoveredOption(option)"
        v-for="option in filteredOptions"
      >
        <va-icon :name="option.icon" class="va-select__option__icon" v-show="option.icon"/>
        <span>{{getText(option)}}</span>
        <va-icon
          class="va-select__option__selected-icon"
          name="material-icons"
          v-show="isSelected(option)">
          done
        </va-icon>
      </li>
    </ul>
    <div
      :style="optionsListStyle"
      class="va-select__option-list no-options"
      v-if="!filteredOptions.length"
    >
      {{noOptionsText}}
    </div>

    <div
      :class="selectClass"
      :style="selectStyle"
      slot="anchor"
    >
      <label
        :style="{ color: $themes.success }"
        aria-hidden="true"
        class="va-select__label"
      >{{label}}</label>
      <div
        :style="inputWrapperStyles"
        class="va-select__input-wrapper"
      >
        <span
          class="va-select__tags"
          v-if="multiple && valueProxy.length <= tagMax"
        >
          <span
            class="va-select__tags__tag"
          >
            {{ valueProxy.join(", ") }}
          </span>
        </span>
        <span class="va-select__displayed-text" v-else-if="displayedText">{{displayedText}}</span>
        <span class="va-select__placeholder" v-else>{{placeholder}}</span>
      </div>
      <va-icon
        @click.native.stop="clear()"
        class="va-select__clear-icon"
        name="fa fa-times-circle"
        v-if="showClearIcon"
      />
      <spring-spinner
        :color="$themes.success"
        :size="24"
        class="va-select__loading"
        v-if="loading"
      />
      <va-icon
        :name="visible ? 'fa fa-angle-up' : 'fa fa-angle-down'"
        class="va-select__open-icon"
      />
    </div>
  </va-dropdown>
</template>

<script>

  import {SpringSpinner} from 'epic-spinners'
  import {getHoverColor} from 'vuestic-ui/src/services/color-functions'

  const positions = {
    'top': 'T',
    'bottom': 'B',
  }
  export default {
    name: 'base-select',
    components: {SpringSpinner},
    data() {
      return {
        search: '',
        mounted: false,
        hoveredOption: null,
      }
    },
    props: {
      value: {},
      label: String,
      placeholder: String,
      options: {
        type: Array,
        default: () => [],
      },
      position: {
        type: String,
        default: 'bottom',
        validator: position => Object.keys(positions).includes(position),
      },
      tagMax: {
        type: Number,
        default: 5,
      },
      searchable: Boolean,
      multiple: Boolean,
      disabled: Boolean,
      readonly: Boolean,
      loading: Boolean,
      width: {
        type: String,
        default: '100%',
      },
      maxHeight: {
        type: String,
        default: '128px',
      },
      keyBy: {
        type: String,
        default: 'id',
      },
      textBy: {
        type: String,
        default: 'text',
      },
      clearValue: {
        default: '',
      },
      noOptionsText: {
        type: String,
        default: 'Items not found',
      },
      fixed: {
        type: Boolean,
        default: true,
      },
      noClear: Boolean,
      error: Boolean,
      success: Boolean,
    },
    watch: {
      search(val) {
        this.$emit('update-search', val)
      },
      visible(val) {
        if (val && this.searchable) {
          this.$nextTick(() => {
            this.$refs.search.$refs.input.focus()
          })
        }
      },
    },
    computed: {
      visible() {
        return this.mounted ? this.$refs.dropdown.isClicked : false
      },
      selectClass() {
        return {
          'va-select': true,
          'va-select--multiple': this.multiple,
          'va-select--visible': this.visible,
          'va-select--searchable': this.searchable,
          'va-select--disabled': this.disabled,
          'va-select--loading': this.loading,
        }
      },
      selectStyle() {
        return {
          backgroundColor:
            this.error ? getHoverColor(this.$themes['danger'])
              : this.success ? getHoverColor(this.$themes['success']) : '#f5f8f9',
          borderColor:
            this.error ? this.$themes.danger
              : this.success ? this.$themes.success
              : this.$themes.gray,
        }
      },
      optionsListStyle() {
        return {maxHeight: this.maxHeight}
      },
      displayedText() {
        if (!this.valueProxy) {
          return ''
        }
        if (this.multiple) {
          return this.valueProxy.length ? `${this.valueProxy.length} items selected` : ''
        }
        // We try to find a match from options, if we don't find any - we take value.
        // This way select can display value even when options are not loaded yet.
        const selectedOption = this.valueProxy || this.selectedOption
        const isString = typeof selectedOption === 'string'
        return isString ? selectedOption : selectedOption[this.textBy]
      },
      selectedOption() {
        return (!this.valueProxy || this.multiple) ? null : this.options.find(option => this.compareOptions(option, this.valueProxy)) || null
      },
      filteredOptions() {
        if (!this.search) {
          return this.options
        }

        return this.options.filter(option => {
          const optionText = this.getText(option).toUpperCase()
          const search = this.search.toUpperCase()
          return optionText.includes(search)
        })
      },
      showClearIcon() {
        if (this.noClear) {
          return false
        }
        if (this.disabled) {
          return false
        }
        return this.multiple ? this.valueProxy.length : this.valueProxy !== this.clearValue
      },
      inputWrapperStyles() {
        let paddingRight = 2
        if (this.showClearIcon) {
          paddingRight += 2
        }
        return {
          paddingRight: `${paddingRight}rem`,
          paddingTop: this.label ? this.multiple ? '.59rem' : '.84rem' : 'inherit',
          paddingBottom: this.label ? 0 : this.multiple ? '.3125rem' : '.4375rem',
        }
      },
      valueProxy: {
        get() {
          return this.value
        },
        set(value) {
          this.$emit('input', value)
        },
      },
    },
    methods: {
      getOptionClass(option) {
        return {
          'va-select__option': true,
          'va-select__option--selected': this.isSelected(option),
        }
      },
      getOptionStyle(option) {
        return {
          color: this.isSelected(option) ? this.$themes['success'] : 'inherit',
          backgroundColor: this.isHovered(option) ? getHoverColor(this.$themes['success']) : 'transparent',
        }
      },
      getText(option) {
        return typeof option === 'string' ? option : option[this.textBy]
      },
      getKey(option) {
        return typeof option === 'string' ? option : option[this.keyBy]
      },
      updateSearch(val) {
        this.search = val
      },
      compareOptions(one, two) {
        // identity check works nice for strings and exact matches.
        if (one === two) {
          return true
        }
        if (typeof this.value === 'string') {
          return false
        }
        return one[this.keyBy] === two[this.keyBy]
      },
      isSelected(option) {
        if (typeof option === 'string') {
          return this.multiple
            ? this.valueProxy.includes(option)
            : this.valueProxy === option
        } else {
          return this.multiple
            ? this.valueProxy.filter(item => item[this.keyBy] === option[this.keyBy]).length
            : this.valueProxy[this.keyBy] === option[this.keyBy]
        }
      },
      isHovered(option) {
        return this.hoveredOption
          ? typeof option === 'string' ? option === this.hoveredOption : this.hoveredOption[this.keyBy] === option[this.keyBy]
          : false
      },
      selectOption(option) {
        this.search = ''
        const isSelected = this.isSelected(option)
        const value = this.value || []

        if (this.multiple) {
          this.valueProxy = isSelected
            ? value.filter(optionSelected => option !== optionSelected)
            : [...value, option]
          this.$refs.dropdown.updatePopper()
        } else {
          this.valueProxy = typeof option === 'string' ? option : {...option}
          this.search = ''
          this.$refs.dropdown.hide()
        }
        if (this.searchable) {
          this.$refs.search.$refs.input.focus()
        }
      },
      clear() {
        this.valueProxy = this.multiple
          ? (Array.isArray(this.clearValue) ? this.clearValue : [])
          : this.clearValue
        this.search = ''
      },
      updateHoveredOption(option) {
        if (option) {
          this.hoveredOption = typeof option === 'string' ? option : {...option}
        } else {
          this.hoveredOption = null
        }
      },
    },
    mounted() {
      this.mounted = true
    },
  }
</script>

<style lang="scss" scoped>

  .va-select {
    cursor: pointer;
    display: flex;
    align-items: flex-end;
    position: relative;
    width: 100%;
    min-height: 2.375rem;
    border-style: solid;
    border-width: 0 0 thin 0;
    margin-bottom: 1rem;

    &--disabled {
      @include va-disabled()
    }

    &--loading {
      .va-select__clear-icon,
      .va-select__open-icon {
        visibility: hidden;
      }
    }

    &__label {
      @include va-title();
      position: absolute;
      top: .125rem;
      left: .5rem;
      margin-bottom: .5rem;
      max-width: calc(100% - .25rem);
      @include va-ellipsis();
      transform-origin: top left;
    }

    &__input-wrapper {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      height: 100%;
      width: 100%;
      justify-content: stretch;
      padding-left: .5rem;
    }

    &__input {
      border: none;
      background: transparent;
      padding: 0.25rem 0;
      font-size: 1rem;
      font-family: $font-family-sans-serif;
      font-weight: normal;
      font-style: normal;
      font-stretch: normal;
      line-height: 1.5;
      letter-spacing: normal;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      margin: 0 .5rem;

      &:focus {
        outline: none;
      }
    }

    &__displayed-text {
      white-space: nowrap;
      overflow-x: hidden;
      text-overflow: ellipsis;
      width: 100%;
    }

    &__placeholder {
      opacity: .5;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      width: 100%;
    }

    &__clear-icon {
      color: $va-link-color-secondary;
      width: 1.5rem;
      height: 1.5rem;
      padding: .25rem;
      position: absolute;
      top: 0;
      bottom: 0;
      right: 2rem;
      margin: auto;
    }

    &__open-icon {
      @extend .va-select__clear-icon;
      right: .5rem;
    }

    &__tags {
      &__tag {
        word-break: break-word;
      }
    }

    &__loading {
      position: absolute;
      right: .5rem;
      top: 0;
      bottom: 0;
      margin: auto;
    }

    &__dropdown {
      outline: none;
      margin: 0;
      padding: 0;
      background: $light-gray3;
      border-radius: .5rem;

      &.va-select__dropdown-position-top {
        box-shadow: 0 -2px 3px 0 rgba(98, 106, 119, 0.25);
      }

      .va-dropdown__anchor {
        display: block;
      }

      .va-dropdown__content {
        background-color: $light-gray3;
        margin: 0;
        padding: 0;
        overflow-y: auto;
        box-shadow: $datepicker-box-shadow;
        border-radius: .5rem;
      }
    }

    &__option-list {
      width: 100%;
      list-style: none;

      &.no-options {
        padding: .5rem;
      }
    }

    &__option {
      cursor: pointer;
      display: flex;
      align-items: center;
      padding: .375rem .5rem .375rem .5rem;
      min-height: 2.25rem;
      word-break: break-word;

      &__selected-icon {
        margin-left: auto;
        font-size: 1.2rem;
      }

      &__icon {
        margin-right: .5rem;
      }
    }
  }


  /*Custom styling*/

  .va-dropdown__content {
    overflow-y: auto;
    border-radius: .5rem;
    margin: 0;
    padding: 0;
  }

  .va-select__clear-icon {
    visibility: hidden;
  }

  .va-select__open-icon {
    visibility: visible;
  }

  .va-select {
    border-radius: 20px !important;
    align-items: center;
    overflow: hidden;
    background: white !important;
    border: 2px solid #2A085E !important;
    box-shadow: rgba(42, 8, 93, 0.4) 0 0.125rem 0.19rem 0 !important;
    color: #2A085D !important;
    height: auto !important;
    min-height: 3rem !important;
    max-height: 5rem !important;
    margin-bottom: 1rem !important;
    margin-top: 0.5rem !important;
    padding-left: 0.5rem !important;
    padding-top: 0.3rem !important;
  }

  .va-select.va-select--multiple.va-select--searchable {
    align-items: center;
    overflow: hidden;
    background: white !important;
    border: 2px solid #2A085E !important;
    /*border-radius: 20px;*/
    box-shadow: rgba(42, 8, 93, 0.4) 0 0.125rem 0.19rem 0 !important;
    color: #2A085D !important;
    height: auto !important;
    min-height: 3rem !important;
    max-height: 5rem !important;
    margin-bottom: 1rem !important;
    margin-top: 0.5rem !important;
    padding-left: 0.5rem !important;
    padding-top: 0.3rem !important;
  }

  .va-select.va-select--multiple.va-select--searchable:hover {
    background-color: #EDEAF1 !important;
  }

  .va-select.va-select--multiple.va-select--searchable:hover {
    background-color: #EDEAF1 !important;
  }

  li.va-select__option {
    background-color: white !important;
  }

  li.va-select__option:hover {
    background-image: linear-gradient(to right, #544991, #634A89) !important;
    color: white !important;
  }

  li.va-select__option.va-select__option--selected {
    background-image: linear-gradient(to right, #160769, #2A085E) !important;
    color: white !important;
  }

  /* Scroll bar */

  .va-dropdown__content::-webkit-scrollbar {
    background-color: transparent !important;
    width: 8px;
  }

  .va-dropdown__content::-webkit-scrollbar-track {
    background-color: transparent;
    border-radius: 20px;
  }

  .va-dropdown__content::-webkit-scrollbar-track-piece {
    background-color: white;
    border-radius: 20px;
  }

  .va-dropdown__content::-webkit-scrollbar-thumb {
    background-color: #2A085E;
    border-radius: 20px;
    -webkit-box-shadow: inset 0 0 6px rgba(245, 246, 250, 0.4);
  }

</style>
