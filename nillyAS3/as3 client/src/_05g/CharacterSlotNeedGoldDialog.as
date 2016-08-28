package _05g
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class CharacterSlotNeedGoldDialog extends Sprite
   {
      
      private static const _bP_:String = "/charSlotNeedGold";
       
      
      public const _1S_H_:Signal = new Signal();
      
      public const cancel:Signal = new Signal();
      
      private var _3B_:Dialog;
      
      private var price:int;
      
      public function CharacterSlotNeedGoldDialog()
      {
         super();
      }
      
      public function setPrice(param1:int) : void
      {
         this.price = param1;
         this._3B_ && contains(this._3B_) && removeChild(this._3B_);
         this._F_Y_();
         this._3B_.addEventListener(Dialog.LEFT_BUTTON,this.onCancel);
         this._3B_.addEventListener(Dialog.RIGHT_BUTTON,this._0T_6);
      }
      
      private function _F_Y_() : void
      {
         this._3B_ = new Dialog(_1O_I_._0T_9,"",_1O_I_._0cV_,_1O_I_._0eY_,_bP_);
         this._3B_._1aO_(_1O_I_._Q_W_,{"price":this.price});
         addChild(this._3B_);
      }
      
      public function onCancel(param1:Event) : void
      {
         this.cancel.dispatch();
      }
      
      public function _0T_6(param1:Event) : void
      {
         this._1S_H_.dispatch();
      }
   }
}
