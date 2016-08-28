package _04e
{
   import Packets.Server.Death;
   
   public class _05X_
   {
       
      
      private var _sR_:Boolean;
      
      private var _025:Death;
      
      public function _05X_()
      {
         super();
      }
      
      public function _0jO_(param1:Death) : void
      {
         this._025 = param1;
         this._sR_ = true;
      }
      
      public function _1sw() : Death
      {
         return this._025;
      }
      
      public function _0z__() : Boolean
      {
         return this._sR_;
      }
      
      public function _I_V_() : void
      {
         this._sR_ = false;
      }
   }
}
