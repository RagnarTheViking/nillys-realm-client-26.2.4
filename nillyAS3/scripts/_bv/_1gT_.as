package _bv
{
   import flash.display.Sprite;
   import _1C_p._16E_;
   
   public class _1gT_ extends Sprite
   {
       
      
      private const _vT_:Number = 306;
      
      private const _89:Number = 194;
      
      private const _0__e:Number = 151;
      
      private const _1jP_:Number = 189;
      
      private const _1dP_:Number = 4;
      
      private const _7c:_bv._aN_ = new _bv._aN_(this._vT_,this._89);
      
      private const _100:_bv._aN_ = new _bv._aN_(this._0__e,this._1jP_);
      
      private const _1ls:_bv._aN_ = new _bv._aN_(this._0__e,this._1jP_);
      
      public function _1gT_()
      {
         super();
         this.tabChildren = false;
         this._0sF_();
         this._6P_();
      }
      
      private function _0sF_() : void
      {
         addChild(this._7c);
         addChild(this._100);
         addChild(this._1ls);
      }
      
      private function _6P_() : void
      {
         this._100.y = this._89 + this._1dP_;
         this._1ls.x = this._0__e + this._1dP_;
         this._1ls.y = this._89 + this._1dP_;
      }
      
      function update(param1:Vector.<_16E_>) : void
      {
         this._7c.init(param1[0]);
         this._100.init(param1[1]);
         this._1ls.init(param1[2]);
         this._7c.load();
         this._100.load();
         this._1ls.load();
      }
   }
}
