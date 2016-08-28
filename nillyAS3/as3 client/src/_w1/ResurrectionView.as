package _w1
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1O_R_.Dialog;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.filters.ColorMatrixFilter;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class ResurrectionView extends Sprite
   {
       
      
      public const _0C_Z_:Signal = new Signal(Sprite);
      
      public const closed:Signal = new Signal();
      
      private const _Q_l:Number = 0;
      
      private const _X_j:Number = 3881787;
      
      private const _0U_k:Number = 300;
      
      private const _0D_F_:Number = 400;
      
      private var _K_M_:Dialog;
      
      public function ResurrectionView()
      {
         super();
      }
      
      public function init(param1:BitmapData) : void
      {
         this._0c0(param1);
         this._1X_O_();
      }
      
      private function _0c0(param1:BitmapData) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:Array = [0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0.33,0.33,0.33,0,0,0.33,0.33,0.33,1,0];
         var _loc4_:ColorMatrixFilter = new ColorMatrixFilter(_loc3_);
         _loc2_ = new Bitmap(param1);
         _loc2_.filters = [_loc4_];
         addChild(_loc2_);
      }
      
      public function _1X_O_() : void
      {
         this._K_M_ = new Dialog(_1O_I_._0I_O_,_1O_I_._ev,_1O_I_._S_p,null,null);
         this._K_M_.addEventListener(Dialog.LEFT_BUTTON,this.onButtonClick);
         this._0C_Z_.dispatch(this._K_M_);
      }
      
      private function onButtonClick(param1:Event) : void
      {
         this.closed.dispatch();
      }
   }
}
