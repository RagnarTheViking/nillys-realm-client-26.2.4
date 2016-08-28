package _03U_
{
   public class _1p__ implements _1U_N_
   {
       
      
      private var _04n:Object;
      
      private var _1g:Object;
      
      public function _1p__()
      {
         this._04n = {};
         this._1g = {};
         super();
      }
      
      public function clear() : void
      {
         this._04n = {};
         this._1g = {};
      }
      
      public function setValue(param1:String, param2:String, param3:String) : void
      {
         this._04n[param1] = param2;
         this._1g[param1] = param3;
      }
      
      public function _1Z_q(param1:String) : Boolean
      {
         return this._04n[param1] != null;
      }
      
      public function getValue(param1:String) : String
      {
         if(this._04n.hasOwnProperty(param1))
         {
            return this._04n[param1];
         }
         return param1;
      }
      
      public function _S_u(param1:String) : String
      {
         return this._1g[param1];
      }
   }
}
