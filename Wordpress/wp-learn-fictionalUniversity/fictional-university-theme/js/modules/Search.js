import $ from 'jquery'

const S_KEY_CODE = 83
const ESC_KEY_CODE = 27
const TIME_OUT_MS = 2000

class Search {
    constructor() {
        this.resultsDiv = $('#search-overlay__results')
        this.openButton = $(".js-search-trigger")
        this.closeButton = $(".search-overlay__close")
        this.searchOverlay = $(".search-overlay")
        this.searchTerm = $('#search-term')
        this.overlayOpen = false
        this.typingTimer
        this.isSpinnerVisible = false
        this.previousSearchTerm
        //To activate event listeners when the js is imported into the page
        this.events();
    }

    // Events
    events() {
        this.openButton.on('click', this.openOverlay.bind(this))
        this.closeButton.on('click', this.closeOverlay.bind(this))
        $(document).on("keydown", this.keyPressedDispatcher.bind(this))
        this.searchTerm.on('keyup', this.typingLogic.bind(this))
    }

    // Methods

    typingLogic() {

        //If the value of the search term hasn't changed, we do not sent a getResults
        if (this.previousSearchTerm != this.searchTerm.val()) {
            clearTimeout(this.typingTimer)


            console.log('val: ',this.searchTerm.val())

            if (this.searchTerm.val()) {

                if (!this.isSpinnerVisible) {
                    this.resultsDiv.html('<div class="spinner-loader"></div>')
                    this.isSpinnerVisible = true
                }

                this.typingTimer = setTimeout(this.getResults.bind(this), TIME_OUT_MS)

            } else {
                this.resultsDiv.html('');
                this.isSpinnerVisible = false
            }

            
        }
       
        this.previousSearchTerm = this.searchTerm.val()
    }

    getResults() {
        console.log('getResults')
        this.resultsDiv.html('Results for :' + this.searchTerm.val()) //replace the spinner with results content
        this.isSpinnerVisible = false
    }

    openOverlay() {
        this.searchOverlay.addClass('search-overlay--active')
        $('body').addClass('body-no-scroll')
        this.overlayOpen = true
    }
    closeOverlay() {
        this.searchOverlay.removeClass('search-overlay--active')
        this.overlayOpen = false
    }
    keyPressedDispatcher(event) {
        if (S_KEY_CODE == event.keyCode && !this.overlayOpen && !$('input', 'textarea').is(':focus')) {
            this.openOverlay()
        }
        if (ESC_KEY_CODE == event.keyCode && this.overlayOpen) {
            this.closeOverlay()
        }

    }
}

export default Search