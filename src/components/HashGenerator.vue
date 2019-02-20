<template>
    <div class="hello">
      <h1>{{msg}}</h1>
      <h3>Digite o texto que deseja converter para o formato HashCode</h3>
      <div class="row">
          <div class="col-md-6 text-left">
              <input v-model="code" type="text" required class="form-control" placeholder="Digite o texto aqui" id="code">
          </div>
          <div class="col-md-6 text-right" >
              <button type="submit" class="btn btn-primary" v-on:click="hashCode(code)">Gerar</button>
              <button type="submit" class="btn btn-primary" v-if="code != ''" v-on:click="clean()">Limpar</button>
          </div>
          <div class="col-md-12" >
              <label for="codeGenerated">{{codeGenerated}}</label>
          </div>
	    </div>
    </div>
</template>

<script>
export default {
  name: 'HashGenerator',
  props: {
    msg: String
  },
  data() {
        return {
            code: '',
            codeGenerated: '',
        }
  },
  methods: {
    hashCode: function(code) {
      var hash = 0, i, chr;
      if (code.length === 0) return hash;
      for (i = 0; i < code.length; i++) {
        chr   = code.charCodeAt(i);
        hash  = ((hash << 5) - hash) + chr;
        hash |= 0; // Convert to 32bit integer
      }
      this.codeGenerated = (hash + 2147483647) + 1;
    },
    clean: function() {
      this.code = '';
      this.codeGenerated = '';  
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
