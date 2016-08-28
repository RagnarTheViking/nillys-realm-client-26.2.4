package _05g
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1O_R_.Dialog;
   import _1S_0.NativeMappedSignal;
   
   public class _1X_G_ extends Sprite
   {
      
      private static const TEXT:String = "In order to have more than one character slot, you must be a registered user.";
      
      private static const TITLE:String = "Not Registered";
      
      private static const CANCEL:String = "Cancel";
      
      private static const _12X_:String = "Register";
      
      private static const _bP_:String = "/charSlotNeedRegister";
       
      
      public var cancel:Signal;
      
      public var register:Signal;
      
      private var _3B_:Dialog;
      
      public function _1X_G_()
      {
         super();
         this._F_Y_();
         this._1tc();
      }
      
      private function _F_Y_() : void
      {
         this._3B_ = new Dialog(TITLE,TEXT,CANCEL,_12X_,_bP_);
         addChild(this._3B_);
      }
      
      private function _1tc() : void
      {
         this.cancel = new NativeMappedSignal(this._3B_,Dialog.LEFT_BUTTON);
         this.register = new NativeMappedSignal(this._3B_,Dialog.RIGHT_BUTTON);
      }
   }
}
