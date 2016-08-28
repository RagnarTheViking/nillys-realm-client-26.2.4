package _1jl
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import flash.geom.ColorTransform;
   import _1R_o._0xf;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import ToolTips._0bd;
   import com.company.util.MoreColorUtil;
   import flash.events.MouseEvent;
   import com.company.util.Keys;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class IconButton extends Sprite implements _Y_5
   {
      
      protected static const _nz:ColorTransform = new ColorTransform(1,220 / 255,133 / 255);
       
      
      public var _18D_:_0xf;
      
      protected var _058:BitmapData;
      
      protected var _0vw:BitmapData;
      
      protected var _1kE_:Bitmap;
      
      protected var _af:String;
      
      protected var _Y_6:ColorTransform = null;
      
      private var toolTip_:_0bd = null;
      
      public function IconButton(param1:BitmapData, param2:String, param3:String)
      {
         this._18D_ = new _0xf();
         super();
         this._058 = param1;
         this._0vw = TextureRedrawer.redraw(this._058,320 / this._058.width,true,0);
         this._1kE_ = new Bitmap(this._0vw);
         this._1kE_.x = -12;
         this._1kE_.y = -12;
         addChild(this._1kE_);
         this._af = param3;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._0t6(param2);
         this._18D_._bD_(this);
         this._18D_.tooltip = this.toolTip_;
      }
      
      private function _0t6(param1:String) : void
      {
         if(param1 != "")
         {
            this.toolTip_ = new _0bd(3552822,10197915,param1,"",200);
         }
      }
      
      public function _Q_T_(param1:ColorTransform) : void
      {
         if(param1 == this._Y_6)
         {
            return;
         }
         this._Y_6 = param1;
         if(this._Y_6 == null)
         {
            transform.colorTransform = MoreColorUtil.identity;
         }
         else
         {
            transform.colorTransform = this._Y_6;
         }
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         this._Q_T_(_nz);
         if(this.toolTip_ != null)
         {
            _loc2_ = Keys._0L_[Parameters.data_[this._af]];
            this.toolTip_._0D_S_(new _dU_().setParams(_1O_I_._fZ_,{"hotkey":_loc2_}));
         }
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         this._Q_T_(null);
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
   }
}
