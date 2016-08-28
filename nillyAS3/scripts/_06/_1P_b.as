package _06
{
   import _0C_j._1D_U_;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import _1xa.SText;
   import _T_E_._0Z_v;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class _1P_b extends _1D_U_
   {
      
      private static const _Z_B_:int = 16;
       
      
      public var clicked:Signal;
      
      private var _G___:SimpleText;
      
      private var _1E_C_:DisplayObject;
      
      private var _0D_n:int = -1;
      
      private var _0V_h:Sprite;
      
      public function _1P_b()
      {
         super();
         this._0V_h = _0Z_v._1P_T_();
         this.clicked = new NativeMappedSignal(this,MouseEvent.CLICK);
         tabChildren = false;
         tabEnabled = false;
         this._1R_y();
      }
      
      public function _0Y_B_(param1:int) : void
      {
         if(this._0D_n != param1)
         {
            this._0D_n = param1;
            this._1vK_();
         }
      }
      
      public function destroy() : void
      {
         parent.removeChild(this);
      }
      
      private function _1R_y() : void
      {
         addChild(this._0V_h);
         this._1E_C_ = makeIcon();
         addChild(this._1E_C_);
         this._U_0();
         this._0Y_B_(0);
      }
      
      private function _U_0() : void
      {
         this._G___ = new SimpleText().setSize(_Z_B_).setColor(16777215);
         this._G___.filters = [new DropShadowFilter(0,0,0)];
         this._1vK_();
         addChild(this._G___);
      }
      
      private function _1vK_() : void
      {
         this._G___.textChanged.addOnce(this.onTextChanged);
         this._G___.setStringBuilder(new SText(this._0D_n.toString() + " day" + (this._0D_n > 1?"s":"")));
      }
      
      private function onTextChanged() : void
      {
         positionText(this._1E_C_,this._G___);
      }
   }
}
