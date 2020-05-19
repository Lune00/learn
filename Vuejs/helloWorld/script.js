var eventBus = new Vue();


Vue.component('product', {
  props: {
    premium: {
      type: Boolean,
      required: true
    },
    message: {
      type: String,
      default: "'Hello you!'",
      required: false
    }
  },
  template: `<div class="product">
  <div class="product-image">
    <img v-bind:src="image" alt="">
  </div>
  <div class="product-info">
    <!-- Attribute binding -->
      <p> {{message}} </p>
    <h1><a :href="link">{{title}}</a></h1>
    <h2>{{description}}</h2>
    <!-- Conditional rendering -->
    <p v-if="inStock">In stock : {{inStock}}</p>
    <!-- <p v-else-if="inventory < 10 && inventory > 5">Almost In stock</p> -->
    <!-- <p v-else :class="{outOfStock :!inStock}">Out of stock</p> -->
    <p v-else :class="class_OutOfStock">Out of stock</p>
    <p v-if="onSale">{{title}}</p>

    <p> {{shipping}} </p>

    <!-- List rendering -->
    <ul>
      <li v-for="detail in details">{{detail}}</li>
    </ul>

    <!-- <div v-for="variant in variants">{{variant.color}}</div> -->

    <!-- List rendering with key -->
    <p>Colors available:</p>
    <div v-for="(variant,index) in variants"
    :key="variants.id"
    class="color-box"

    :style="{backgroundColor: variant.color}"
    @mouseover="updateProduct(index)">
    </div>
    <p>Sizes available:</p>
    <ul>
      <li v-for="size in sizes" >{{size}}</li>
    </ul>

  </div>

  <button v-on:click="addToCart"
  :class="{disabledButton: !inStock}"
  :disabled="!inStock">Add to cart</button>
  <button @click="removeFromCart">Remove from cart</button>

  <product-tabs :reviews="reviews"></product-tabs>
</div>
`,
  data() {
    return {
      products: 'Socks',
      brand: 'PS Socks Rocks',
      description: 'These socks are really good',
      selectedVariant: 0,
      link: 'https://fr.wikipedia.org/wiki/Chaussette',
      details: ['80% coton', '20% Polyester', 'Gender-neutral'],
      variants: [{
          id: 2232,
          color: 'Green',
          image: './vmSocks-green-onWhite.jpg',
          quantity: 103,
          onSale: true,
        },
        {
          id: 2233,
          color: 'Blue',
          image: './vmSocks-blue-onWhite.jpg',
          quantity: 1,
          onSale: false,
        }
      ],
      sizes: ['33', '36', '38', '40', '44'],

      class_OutOfStock: {
        outOfStock: !this.inStock
      },
      reviews: []
    }
  },

  methods: {
    addToCart() {
      this.$emit('add-to-cart', this.variants[this.selectedVariant].id);
    },
    removeFromCart() {
      this.$emit('remove-from-cart', this.variants[this.selectedVariant].id);
    },
    updateProduct(index) {
      this.selectedVariant = index;
    },
  },

  computed: {
    title() {
      return this.products + ' ' + this.brand;
    },
    image() {
      return this.variants[this.selectedVariant].image;
    },
    inStock() {
      return this.variants[this.selectedVariant].quantity;
    },
    onSale() {
      return this.variants[this.selectedVariant].onSale;
    },
    shipping() {
      if (this.premium)
        return 'Free';
      return '2.99euro';
    },
    nbReviews() {
      return this.reviews.length;
    },
    mounted(){
      console.log('handle post review');
      eventBus.$on('review-submitted', productReview => {
        this.reviews.push(productReview);
      });
    }
  }
})


Vue.component('product-review', {

  template: `
  <form class="review-form" @submit.prevent="onSubmit">
  <p v-if="errors.length">
<b>Errors : {{errors}}</b>
  </p>
  <p>
    <label for="pseudo" >Pseudo:</label>
    <input name="pseudo" id="pseudo" v-model="pseudo">
  </p>
  <p>
    <label for="review">Review:</label>
    <textarea name="review" rows="8" cols="80" v-model="review"></textarea>
  </p>

  <p>
    <label for="rating">Rating</label>
    <select name="rating" id="rating" v-model.number="rating">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </p>

  <div>
  <div>Would you recommand this product ?</div>

  <label for="yes">Yes</label>
  <input type="radio" name="recommand" value="true" id="yes" v-model="recommand">
<label for="no">No</label>
  <input type="radio" name="choice" value="false" id="no" v-model="recommand">
  </div>
  <input type="submit" value="Submit">
  </form>
`,
  data() {
    return {
      review: null,
      rating: null,
      pseudo: null,
      recommand: false,
      errors: []
    }
  },
  methods: {
    onSubmit() {
      if (!this.pseudo || !this.review || !this.rating || this.recommand === null) {
        this.errors.push('Formulaire non valide!')
        return;
      }

      let productReview = {
        review: this.review,
        rating: this.rating,
        pseudo: this.pseudo,
        recommand: this.recommand
      };

      eventBus.$emit('review-submitted', productReview);
      //Reset data of the component

      this.review = null;
      this.rating = null;
      this.pseudo = null;
      this.recommand = false;
    }
  }
});



Vue.component('product-tabs', {

  props: {
    reviews: {
      type: Array,
      required: true
    }
  },
  template: `
<div>

<span class="tab"
v-for="(tab,index) in tabs"
:key="index"
@click="selectedTab = tab"
:class="{ activeTab: selectedTab === tab }">
{{tab}}
</span>
<div v-show="selectedTab === 'Reviews'">
<h2>Product Reviews</h2>
<p v-if="!reviews.length">There are no reviews yet</p>
<p v-else>
<ul>
  <li v-for="review in reviews">
    <p>Review posted by {{review.pseudo}}</p>
    <p>{{review.rating}}</p>
    <p>{{review.review}}</p>
    <p v-if="review.recommand">Produit recommandé!</p>
  </li>
</ul>
</p>
</div>
<product-review
v-show="selectedTab === 'Make a Review'">
</product-review>
</div>
`,
  data() {
    return {
      tabs: ['Reviews', 'Make a Review'],
      selectedTab: 'Reviews'
    }
  }


})

var app = new Vue({
  el: '#app',
  data: {
    premiumUser: true,
    cart: [],
  },
  methods: {
    addToCart(id) {
      this.cart.push(id);
    },
    removeFromCart(id) {
      console.log('id product to remove:', id);
      const index = this.cart.indexOf(id);
      console.log('index', index);
      if (index > -1)
        this.cart.splice(index, 1);
    }
  },
})
