package _1k1
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class ReskinPanel extends Panel
   {
       
      
      private const title:SimpleText = this._1lN_();
      
      private const button:Button = this._1lo();
      
      private const _E_4:Signal = new NativeMappedSignal(this.button,MouseEvent.CLICK);
      
      public const reskin:Signal = new Signal();
      
      public function ReskinPanel(param1:GameSprite = null)
      {
         super(param1);
         this._E_4.add(this._1k9);
      }
      
      private function _1k9() : void
      {
         this.reskin.dispatch();
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(18).setColor(16777215).setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.x = WIDTH / 2;
         _loc1_.setBold(true);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._0D_4));
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lo() : Button
      {
         var _loc1_:Button = new Button(16,_1O_I_._0vf);
         _loc1_.textChanged.addOnce(this._1qX_);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1qX_() : void
      {
         this.button.x = WIDTH / 2 - this.button.width / 2;
         this.button.y = HEIGHT - this.button.height - 4;
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this.reskin.dispatch();
         }
      }
   }
}
