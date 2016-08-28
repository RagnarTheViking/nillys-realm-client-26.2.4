package _1cV_
{
   import _0sb._1it;
   import _f7.Signal;
   
   public final class Console
   {
       
      
      private var hash:_1cV_._W_C_;
      
      private var history:_1cV_._J_o;
      
      public function Console()
      {
         super();
         this.hash = new _1cV_._W_C_();
         this.history = new _1cV_._J_o();
      }
      
      public function register(param1:_1it, param2:Signal) : void
      {
         this.hash.register(param1.name,param1.description,param2);
      }
      
      public function _0V_u(param1:String) : Boolean
      {
         return this.hash._1O_t(param1);
      }
      
      public function execute(param1:String) : void
      {
         this.history.add(param1);
         this.hash.execute(param1);
      }
      
      public function _1jn() : Vector.<String>
      {
         return this.hash._1jn();
      }
      
      public function _3C_() : String
      {
         return this.history._0yY_();
      }
      
      public function _1J_u() : String
      {
         return this.history._0G_r();
      }
   }
}
