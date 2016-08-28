package _0mi
{
   import _P_N_.FancyDialog;
   import _1O_R_._1uu;
   import _1O_R_._1O_f;
   import _f7.Signal;
   import _1O_R_.Dialog;
   
   public class EvolveDialog extends FancyDialog implements _1uu
   {
      
      private static const _e:int = 6;
       
      
      private const _0M_v:_1O_f = new _1O_f();
      
      public var _1Y_d:_0mi._1G_K_;
      
      public function EvolveDialog(param1:_0mi._1G_K_)
      {
         this._1Y_d = param1;
         super("EvolveDialog.title","","ErrorDialog.ok",null,null);
         this._0M_v.add(this,Dialog.LEFT_BUTTON);
         _0Y_0 = param1.width + 1;
      }
      
      override protected function makeUIAndAdd() : void
      {
         box_.addChild(this._1Y_d);
      }
      
      override protected function drawAdditionalUI() : void
      {
         this._1Y_d.x = (_0Y_0 - this._1Y_d.width) / 2;
         this._1Y_d.y = _7H_.getBounds(box_).bottom + _e;
      }
      
      override protected function drawGraphicsTemplate() : void
      {
         super.drawGraphicsTemplate();
         var _loc1_:Number = this._1Y_d.getBounds(rect_).bottom;
         _0q__.drawLine(_loc1_);
      }
      
      public function _1tG_() : Signal
      {
         return this._0M_v._1tG_();
      }
   }
}
