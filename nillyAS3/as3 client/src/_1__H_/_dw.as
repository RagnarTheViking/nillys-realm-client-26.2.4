package _1__H_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _05g._1S_m;
   import _0xn._1uk;
   
   public class _dw extends Sprite
   {
       
      
      private const _1L_G_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private const _qI_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private const WIDTH:uint = 238;
      
      private const HEIGHT:uint = 30;
      
      private const _0ci:uint = 10;
      
      private const _0O_e:uint = 21;
      
      public function _dw()
      {
         super();
         this._0c0();
         this._0sF_();
         this._0kA_("Text","Text");
         this._0J_k();
      }
      
      public function _0kA_(param1:String, param2:String) : void
      {
         this._1L_G_.setStringBuilder(new _dU_().setParams(param1));
         this._qI_.setStringBuilder(new _dU_().setParams(param2));
      }
      
      private function _0sF_() : void
      {
         addChild(this._1L_G_);
         addChild(this._qI_);
      }
      
      private function _0c0() : void
      {
         graphics.beginFill(10066329);
         graphics.drawRect(0,0,this.WIDTH,this.HEIGHT);
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._1L_G_.textChanged);
         _loc1_.push(this._qI_.textChanged);
         _loc1_.complete.addOnce(this._D_q);
      }
      
      private function _D_q() : void
      {
         this._1L_G_.x = this._0ci;
         this._1L_G_.y = this._0O_e;
         this._qI_.x = this.WIDTH - this._0ci - this._qI_.width;
         this._qI_.y = this._0O_e;
      }
   }
}
