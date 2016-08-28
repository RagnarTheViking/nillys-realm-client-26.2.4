package _1H_T_
{
   import flash.geom.Matrix;
   import flash.display.Bitmap;
   import _0H_6.GameContext;
   import _1gF_._0ke;
   import _1xa.SText;
   import flash.display.BitmapData;
   import _1O_n._zL_;
   
   public class _T_U_ extends _S_A_
   {
      
      private static const _0L_P_:Matrix = new Matrix();
       
      
      public var hotKey:int;
      
      private var _16x:Bitmap;
      
      public function _T_U_(param1:int, param2:_zL_, param3:Boolean)
      {
         super(param1,param2,param3);
      }
      
      public function _11U_(param1:int) : void
      {
         this.hotKey = param1;
         this._1W_u();
      }
      
      public function _1W_u() : void
      {
         var _loc1_:_0ke = GameContext.getInjector().getInstance(_0ke);
         var _loc2_:BitmapData = _loc1_.make(new SText(String(this.hotKey)),26,3552822,true,_0L_P_,false);
         this._16x = new Bitmap(_loc2_);
         this._16x.x = WIDTH / 2 - this._16x.width / 2;
         this._16x.y = HEIGHT / 2 - 14;
         addChildAt(this._16x,0);
      }
      
      override public function setItemSprite(param1:_yF_) : void
      {
         super.setItemSprite(param1);
         param1.setDim(false);
      }
      
      override public function setItem(param1:int) : Boolean
      {
         var _loc2_:Boolean = super.setItem(param1);
         if(_loc2_)
         {
            this._16x.visible = _1lh.itemId <= 0;
         }
         return _loc2_;
      }
      
      override protected function beginDragCallback() : void
      {
         this._16x.visible = true;
      }
      
      override protected function endDragCallback() : void
      {
         this._16x.visible = _1lh.itemId <= 0;
      }
   }
}
