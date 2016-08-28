package _04h
{
   public class _11o
   {
       
      
      private var name:String;
      
      private var key:String;
      
      private var _S_h:Vector.<_04h._083>;
      
      public function _11o(param1:String, param2:String)
      {
         super();
         this.name = param1;
         this.key = param2;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getKey() : String
      {
         return this.key;
      }
      
      public function _0kz() : Vector.<_04h._083>
      {
         return this._S_h;
      }
      
      public function _wv(param1:Vector.<_04h._083>) : void
      {
         this._S_h = param1;
      }
      
      public function _19W_() : Boolean
      {
         return this._S_h != null;
      }
      
      public function _17N_() : void
      {
         this._S_h = null;
      }
   }
}
