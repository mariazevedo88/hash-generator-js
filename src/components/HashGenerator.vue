<template>
    <div class="hello">
      <h4><b>Digite o texto que deseja converter para o formato hashcode</b></h4>
      <div class="row">
          <div class="col-md-4 inner input-group">
              <input id="code" name="code" v-model="code" type="text" class="form-control" placeholder="Digite o texto aqui..." 
                aria-label="Digite o texto aqui..." required>
              <span class="input-group-btn">
                <button class="btn btn-dark" type="submit" v-on:click="hashCode(code)"><b>Gerar</b></button>
              </span>
              <span class="input-group-btn">
                <button class="btn btn-dark" :disabled="code == ''" type="submit" v-on:click="clean()"><b>Limpar</b></button>
              </span>
          </div>
          <div class="col-md-9 inner result">
              <h4 for="codeGenerated"><b>{{codeGenerated}}</b></h4>
          </div>
	    </div>
      <!-- Footer -->
      <footer class="page-footer my-footer">
          <!-- Copyright -->
          <div class="footer-copyright text-center py-3">
            <label><b>© 2019</b></label>
            <a href="https://mariazevedo88.github.io/"><img class="github" src="/static/github.png"></a>
            <a><b>Mariana Azevedo</b></a>
          </div>
          <!-- Copyright -->
      </footer>
      <!-- Footer -->
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
          code: "",
          codeGenerated: null,
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
        this.codeGenerated = hash < 0 ? hash*-1 : hash;
    },
    clean: function() {
        this.code = "";
        this.codeGenerated = null;  
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
  color: #c05d23;
  
}
.inner {
  width: 50%;
  margin: 0 auto;
}
.btn {
  border-radius: 0;
}
.result{
  width: 50%;
  margin-top: 20px;

}
.my-footer{
  width: 100%;
  height: 100px;
  position: absolute;
  bottom: 0;
  left: 0;
}
.github{
  width: 20px;
}
.hello{
  overflow-x: hidden;
}
</style>