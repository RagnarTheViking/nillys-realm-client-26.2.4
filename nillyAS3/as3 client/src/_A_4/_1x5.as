package _A_4
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _f7.Signal;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class _1x5 extends Sprite
   {
       
      
      private const _0kW_:SimpleText = makeText();
      
      private var _1L_N_;
      
      public const _1jE_:Signal = new Signal();
      
      private var _N_G_:Class;
      
      public function _1x5()
      {
         this._N_G_ = _1qH_;
         this._1L_N_ = this._bs();
         super();
      }
      
      private function makeText() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(16).setColor(11776947).setBold(true);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._36));
         _loc1_.textChanged.addOnce(this.layout);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _bs() : *
      {
         var _loc1_:* = new this._N_G_();
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function layout() : void
      {
         this._0kW_.y = height / 2 - this._0kW_.height / 2 + 1;
         this._1L_N_.x = this._0kW_.x + this._0kW_.width;
         this._1jE_.dispatch();
      }
   }
}
