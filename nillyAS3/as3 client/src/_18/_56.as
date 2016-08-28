package _18
{
   import flash.display.Sprite;
   import _S_b._1K_S_;
   
   public class _56 extends Sprite
   {
       
      
      private var stats:_18._0I_h;
      
      public function _56(param1:uint)
      {
         this.stats = new _18._0I_h();
         super();
         this.init();
         this._6P_(param1);
         this._0sF_();
      }
      
      private function _0sF_() : void
      {
         addChild(this.stats);
      }
      
      private function _6P_(param1:uint) : void
      {
         this.stats.y = (param1 - _0M_3._vK_) / 2 - this.stats.height / 2;
      }
      
      private function init() : void
      {
         this.stats.name = _1K_S_._0pf;
      }
   }
}
