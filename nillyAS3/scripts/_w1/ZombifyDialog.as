package _w1
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1O_R_.Dialog;
   import flash.events.Event;
   
   public class ZombifyDialog extends Sprite
   {
      
      public static const TITLE:String = "ZombifyDialog.title";
      
      public static const _0zB_:String = "ZombifyDialog.body";
      
      public static const _return:String = "ZombifyDialog.button";
       
      
      public const closed:Signal = new Signal();
      
      private var _3B_:Dialog;
      
      public function ZombifyDialog()
      {
         super();
         this._3B_ = new Dialog(TITLE,_0zB_,_return,null,null);
         this._3B_._1vR_ = -100;
         this._3B_._038 = 200;
         this._3B_.addEventListener(Dialog.LEFT_BUTTON,this.onButtonClick);
         addChild(this._3B_);
      }
      
      private function onButtonClick(param1:Event) : void
      {
         this.closed.dispatch();
      }
   }
}
