package _2F_
{
   public class _0p
   {
       
      
      private var _0H_C_:Boolean;
      
      private var _key:String;
      
      public function _0p(param1:*, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this._key = String(param1).toUpperCase();
         if(param1 is uint)
         {
            this._0H_C_ = true;
         }
         else if(!param1 || this._key.length != 1)
         {
            throw new Error("KeyBind: character (first char) must be a single character. You gave [" + param1 + "]");
         }
         if(this._0H_C_)
         {
            this._key = "keycode:" + this._key;
         }
         if(param2)
         {
            this._key = this._key + "+shift";
         }
         if(param3)
         {
            this._key = this._key + "+ctrl";
         }
         if(param4)
         {
            this._key = this._key + "+alt";
         }
         if(param5)
         {
            this._key = this._key + "+up";
         }
      }
      
      public function get _5f() : Boolean
      {
         return this._0H_C_;
      }
      
      public function get key() : String
      {
         return this._key;
      }
   }
}
