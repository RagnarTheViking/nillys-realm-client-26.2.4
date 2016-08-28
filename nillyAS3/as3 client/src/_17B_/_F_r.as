package _17B_
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import _1F_z._1Z_D_;
   import _S_b._1K_S_;
   import _1xa._dU_;
   import _1F_z._1r__;
   import _1F_z._of;
   import _0xn._1uk;
   
   public class _F_r extends Sprite
   {
       
      
      public var _07P_:Bitmap;
      
      private var _1Y_5:Sprite;
      
      public var _vp:SimpleText;
      
      private var _H_s:SimpleText;
      
      private var _1nJ_:SimpleText;
      
      private var petVO:_1Z_D_;
      
      public function _F_r()
      {
         this._1Y_5 = new Sprite();
         this._vp = _1uk._0M_n(11776947,13,false);
         this._H_s = _1uk._0M_n(11776947,15,true);
         this._1nJ_ = _1uk._0M_n(11776947,13,false);
         super();
      }
      
      public function init(param1:_1Z_D_) : void
      {
         this.petVO = param1;
         this._07P_ = param1._nV_();
         this._0sF_();
         this._0r5();
         this._6P_();
         this._1__b();
         this._1Y_5.name = _1K_S_._1G_w;
         param1._aL_.add(this._x7);
      }
      
      private function _x7() : void
      {
         this._04V_();
         this._vp.setStringBuilder(new _dU_().setParams(this.petVO._1b8()));
      }
      
      private function _04V_() : void
      {
         this._1Y_5.removeChild(this._07P_);
         this._07P_ = this.petVO._nV_();
         this._1Y_5.addChild(this._07P_);
      }
      
      private function _0r5() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:_02G_ = null;
         var _loc3_:uint = 3;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _loc2_ = new _02G_(this.petVO._0qB_[_loc1_],171);
            _loc2_.x = 3;
            _loc2_.y = 72 + 17 * _loc1_;
            this._1Y_5.addChild(_loc2_);
            _loc1_++;
         }
      }
      
      private function _1S_w() : uint
      {
         var _loc1_:Boolean = this.petVO._1b8() == _1r__._99.value || this.petVO._1b8() == _1r__._1Z_n.value;
         if(_loc1_)
         {
            return 2;
         }
         return 3;
      }
      
      private function _1__b() : void
      {
         this._H_s.setStringBuilder(new _dU_().setParams(this.petVO.getName()));
         this._vp.setStringBuilder(new _dU_().setParams(this.petVO._1b8()));
         this._1nJ_.setStringBuilder(new _dU_().setParams(_of._1s0(this.petVO._1lu())));
      }
      
      private function _0sF_() : void
      {
         this._1Y_5.addChild(this._07P_);
         this._1Y_5.addChild(this._H_s);
         this._1Y_5.addChild(this._vp);
         this._1Y_5.addChild(this._1nJ_);
         addChild(this._1Y_5);
      }
      
      private function _6P_() : void
      {
         this._07P_.x = this._07P_.x - 8;
         this._07P_.y--;
         this._1Y_5.x = 7;
         this._1Y_5.y = 6;
         this._H_s.x = 45;
         this._H_s.y = 20;
         this._vp.x = 45;
         this._vp.y = 33;
         this._1nJ_.x = 45;
         this._1nJ_.y = 47;
      }
   }
}
