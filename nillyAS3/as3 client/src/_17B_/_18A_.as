package _17B_
{
   import ToolTips.ToolTip;
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._0fL_;
   import flash.display.Bitmap;
   import _1F_z._1Z_D_;
   import _1xa._dU_;
   import _1F_z._of;
   import _0xn._bf;
   import _1F_z._gC_;
   import _1F_z._1r__;
   import _0xn._1uk;
   import _S_b._1K_S_;
   
   public class _18A_ extends ToolTip
   {
       
      
      private const _1Y_5:Sprite = new Sprite();
      
      private const _set:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private const _vp:SimpleText = _1uk._0M_n(11776947,12,false);
      
      private const _1nJ_:SimpleText = _1uk._0M_n(11776947,12,false);
      
      private const _0C_F_:_0fL_ = _1uk._0S_d();
      
      private var _07P_:Bitmap;
      
      private var petVO:_1Z_D_;
      
      public function _18A_(param1:_1Z_D_)
      {
         this.petVO = param1;
         super(3552822,1,16777215,1,true);
         this._1Y_5.name = _1K_S_._1G_w;
      }
      
      public function init() : void
      {
         this._07P_ = this.petVO._nV_();
         this._0sF_();
         this._0r5();
         this._6P_();
         this._1__b();
      }
      
      private function _1__b() : void
      {
         this._set.setStringBuilder(new _dU_().setParams(this.petVO.getName()));
         this._vp.setStringBuilder(new _dU_().setParams(this.petVO._1b8()));
         this._1nJ_.setStringBuilder(new _dU_().setParams(_of._1s0(this.petVO._1lu())));
      }
      
      private function _0sF_() : void
      {
         this._1Y_5.graphics.beginFill(0,0);
         this._1Y_5.graphics.drawRect(0,0,_bf._0J_M_,_bf._1J_3);
         this._1Y_5.addChild(this._07P_);
         this._1Y_5.addChild(this._set);
         this._1Y_5.addChild(this._vp);
         this._1Y_5.addChild(this._1nJ_);
         this._1Y_5.addChild(this._0C_F_);
         addChild(this._1Y_5);
      }
      
      private function _0r5() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:_gC_ = null;
         var _loc3_:_02G_ = null;
         var _loc4_:uint = 3;
         _loc1_ = 0;
         while(_loc1_ < _loc4_)
         {
            _loc2_ = this.petVO._0qB_[_loc1_];
            _loc3_ = new _02G_(_loc2_,174);
            _loc3_.x = 8;
            _loc3_.y = 86 + 17 * _loc1_;
            this._1Y_5.addChild(_loc3_);
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
      
      private function _6P_() : void
      {
         this._set.x = 55;
         this._set.y = 21;
         this._vp.x = 55;
         this._vp.y = 35;
         this._1nJ_.x = 55;
         this._1nJ_.y = 48;
      }
   }
}
