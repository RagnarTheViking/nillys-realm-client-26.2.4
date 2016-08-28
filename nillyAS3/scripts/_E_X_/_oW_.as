package _E_X_
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import _f7.Signal;
   import flash.display.Bitmap;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class _oW_ extends Sprite
   {
       
      
      private const _1sT_:ColorTransform = new ColorTransform(0.5,0.5,0.5);
      
      private const _7g:ColorTransform = new ColorTransform(1,1,1);
      
      public const _ah:Signal = new Signal(int);
      
      private var zoomOut:Sprite;
      
      private var zoomIn:Sprite;
      
      private var _T_h:int;
      
      private var _1ga:int;
      
      public function _oW_()
      {
         super();
         this._1ga = 0;
         this._0I_7();
         this._oI_();
         this._0tl();
      }
      
      public function _uz() : int
      {
         return this._1ga;
      }
      
      public function _L_o(param1:int) : int
      {
         if(this._T_h == 0)
         {
            return this._1ga;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 >= this._T_h - 1)
         {
            param1 = this._T_h - 1;
         }
         this._1ga = param1;
         this._0tl();
         return this._1ga;
      }
      
      public function _M_A_(param1:int) : int
      {
         this._T_h = param1;
         if(this._1ga >= this._T_h)
         {
            this._1ga = this._T_h - 1;
         }
         this._0tl();
         return this._T_h;
      }
      
      private function _0I_7() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = TextureLibrary.getBitmap("lofiInterface",54);
         _loc1_ = new Bitmap(_loc2_);
         _loc1_.scaleX = 2;
         _loc1_.scaleY = 2;
         this.zoomOut = new Sprite();
         this.zoomOut.x = 0;
         this.zoomOut.y = 4;
         this.zoomOut.addChild(_loc1_);
         this.zoomOut.addEventListener(MouseEvent.CLICK,this._1D_u);
         addChild(this.zoomOut);
      }
      
      private function _oI_() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = TextureLibrary.getBitmap("lofiInterface",55);
         _loc1_ = new Bitmap(_loc2_);
         _loc1_.scaleX = 2;
         _loc1_.scaleY = 2;
         this.zoomIn = new Sprite();
         this.zoomIn.x = 0;
         this.zoomIn.y = 14;
         this.zoomIn.addChild(_loc1_);
         this.zoomIn.addEventListener(MouseEvent.CLICK,this._3y);
         addChild(this.zoomIn);
      }
      
      private function _1D_u(param1:MouseEvent) : void
      {
         if(this._1__2())
         {
            this._ah.dispatch(--this._1ga);
            this.zoomOut.transform.colorTransform = !!this._1__2()?this._7g:this._1sT_;
         }
      }
      
      private function _1__2() : Boolean
      {
         return this._1ga > 0;
      }
      
      private function _3y(param1:MouseEvent) : void
      {
         if(this._0R_P_())
         {
            this._ah.dispatch(++this._1ga);
            this.zoomIn.transform.colorTransform = !!this._0R_P_()?this._7g:this._1sT_;
         }
      }
      
      private function _0R_P_() : Boolean
      {
         return this._1ga < this._T_h - 1;
      }
      
      private function _0tl() : void
      {
         this.zoomIn.transform.colorTransform = !!this._0R_P_()?this._7g:this._1sT_;
         this.zoomOut.transform.colorTransform = !!this._1__2()?this._7g:this._1sT_;
      }
   }
}
