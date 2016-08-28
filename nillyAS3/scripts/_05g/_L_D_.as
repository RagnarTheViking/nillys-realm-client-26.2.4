package _05g
{
   import flash.display.Sprite;
   import mx.core.BitmapAsset;
   import _S_b._0jn;
   
   public class _L_D_ extends Sprite
   {
      
      private static var _true:Class = _4R_;
      
      private static var _1S_o:Class = _0qS_;
      
      private static var _104:Class = _0S_1;
      
      private static var _X_5:Class = _18f;
      
      private static var _0X_P_:Class = _6A_;
       
      
      private var base:BitmapAsset;
      
      private var _1vx:Vector.<BitmapAsset>;
      
      public function _L_D_()
      {
         var _loc1_:int = 0;
         super();
         this.base = new _true();
         addChild(this.base);
         this._1vx = new Vector.<BitmapAsset>(4,true);
         this._1vx[0] = new _0X_P_();
         this._1vx[1] = new _1S_o();
         this._1vx[2] = new _104();
         this._1vx[3] = new _X_5();
         while(_loc1_ < 4)
         {
            this._1vx[_loc1_].x = 12 + 40 * _loc1_;
            this._1vx[_loc1_].y = 12;
            _loc1_++;
         }
      }
      
      public function _1A_N_(param1:_0jn) : void
      {
         var _loc2_:BitmapAsset = this._1vx[param1.position];
         if(!contains(_loc2_))
         {
            addChild(_loc2_);
         }
      }
      
      public function _0nL_(param1:_0jn) : void
      {
         var _loc2_:BitmapAsset = this._1vx[param1.position];
         if(contains(_loc2_))
         {
            removeChild(_loc2_);
         }
      }
   }
}
