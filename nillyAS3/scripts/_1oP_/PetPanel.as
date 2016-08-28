package _1oP_
{
   import _0Z_1.Panel;
   import _yt._1gD_;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _1S_0._1mh;
   import flash.display.Sprite;
   import _1F_z._1Z_D_;
   import flash.display.Bitmap;
   import _C_._1O_I_;
   import _0xn._bf;
   import _1xa._dU_;
   import flash.events.MouseEvent;
   import _17B_._18A_;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import ToolTips.ToolTip;
   import _0xn._1uk;
   
   public class PetPanel extends Panel
   {
      
      private static const _Z_B_:int = 16;
      
      private static const _0L_O_:int = 6;
      
      private static const _0fd:int = 5;
       
      
      public const _1am:Signal = new Signal(ToolTip);
      
      private const _0mP_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private const _ua:SimpleText = _1uk._0M_n(11974326,12,false);
      
      public var _1bD_:_1mh;
      
      public var _1Z_g:Sprite;
      
      public var _1P_x:_1gD_;
      
      public var _tJ_:_1gD_;
      
      public var _17O_:_1gD_;
      
      public var petVO:_1Z_D_;
      
      private var _07P_:Bitmap;
      
      public function PetPanel(param1:GameSpriteBase, param2:_1Z_D_)
      {
         this._1Z_g = new Sprite();
         super(param1);
         this.petVO = param2;
         this._1bD_ = new _1mh(this._1Z_g,MouseEvent.MOUSE_OVER);
         this._1bD_.add(this._86);
         this._07P_ = param2._nV_();
         this._0sF_();
         this._6P_();
         this._1__b();
         this._N_w();
      }
      
      private static function _1nP_(param1:_1gD_) : void
      {
         param1.y = HEIGHT - param1.height - 4;
      }
      
      private function _N_w() : void
      {
         this._1P_x = this._1lo(_1O_I_._cM_);
         this._tJ_ = this._1lo(_1O_I_._6b);
         this._17O_ = this._1lo(_1O_I_._0U_Z_);
         this._0Z_q();
      }
      
      private function _1lo(param1:String) : _1gD_
      {
         var _loc2_:_1gD_ = new _1gD_(_Z_B_,param1);
         addChild(_loc2_);
         return _loc2_;
      }
      
      public function setState(param1:uint) : void
      {
         this._0Z_P_(param1 == _bf._10X_);
      }
      
      public function _0Z_P_(param1:Boolean) : void
      {
         this._1P_x.visible = param1;
         this._tJ_.visible = param1;
         this._17O_.visible = !param1;
      }
      
      private function _0sF_() : void
      {
         this._1Z_g.addChild(this._07P_);
         addChild(this._1Z_g);
         addChild(this._0mP_);
         addChild(this._ua);
      }
      
      private function _1__b() : void
      {
         this._0mP_.setStringBuilder(new _dU_().setParams(this.petVO.getName()));
         this._ua.setStringBuilder(new _dU_().setParams(this.petVO._1b8()));
      }
      
      private function _6P_() : void
      {
         this._07P_.x = 4;
         this._07P_.y = -3;
         this._0mP_.x = 58;
         this._0mP_.y = 23;
         this._ua.x = 58;
         this._ua.y = 35;
      }
      
      private function _0Z_q() : void
      {
         this._1ie();
         this._0K_y();
         this._0T_Q_();
      }
      
      private function _1ie() : void
      {
         this._1P_x.x = _0L_O_;
         _1nP_(this._1P_x);
      }
      
      private function _0K_y() : void
      {
         this._tJ_.x = WIDTH - this._tJ_.width - _0L_O_ - _0fd;
         _1nP_(this._tJ_);
      }
      
      private function _0T_Q_() : void
      {
         this._17O_.x = (WIDTH - this._17O_.width) / 2;
         _1nP_(this._17O_);
      }
      
      private function _86(param1:MouseEvent) : void
      {
         var _loc2_:_18A_ = new _18A_(this.petVO);
         _loc2_._0Z_3(this);
         this._1am.dispatch(_loc2_);
      }
   }
}
