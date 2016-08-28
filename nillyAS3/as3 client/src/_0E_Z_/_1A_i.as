package _0E_Z_
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.filters.ColorMatrixFilter;
   import com.company.util.MoreColorUtil;
   
   public class _1A_i extends Sprite
   {
      
      public static const _1iP_:int = 0;
      
      public static const _10t:int = 1;
      
      public static const _mI_:int = 2;
      
      public static const _0ey:int = 3;
      
      public static const _N_R_:int = 4;
      
      public static const _1ej:int = 0;
       
      
      private const _041:Number = 176;
      
      public var _6s:Bitmap;
      
      private var _1mf:Vector.<Bitmap>;
      
      private var _18O_:Number = 210;
      
      private var _1G_6:Number = 0;
      
      private var _1__A_:Number;
      
      public var size_:int = 150;
      
      public function _1A_i()
      {
         var _loc1_:BitmapData = null;
         var _loc2_:uint = 0;
         var _loc3_:Bitmap = null;
         super();
         this._1mf = new Vector.<Bitmap>();
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            _loc3_ = new Bitmap(_loc1_);
            _loc3_.filters = [new ColorMatrixFilter(MoreColorUtil._iz)];
            this._1mf.push(_loc3_);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 16 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 32 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 48 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 64 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 80 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         this.reset();
         _loc1_ = TextureLibrary.getBitmap("lofiCharBig",32);
         _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,_1ej,false);
         this._6s = new Bitmap(_loc1_);
         addChild(this._6s);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function reset() : void
      {
         this._1U_F_(_0ey);
      }
      
      public function setXPos(param1:Number) : void
      {
         this.x = param1 - this.width / 2;
      }
      
      public function setYPos(param1:Number) : void
      {
         this.y = param1 - this.height / 2;
      }
      
      public function getCenterX() : Number
      {
         return this.x + this.width / 2;
      }
      
      public function getCenterY() : Number
      {
         return this.y + this.height / 2;
      }
      
      public function _1G_l(param1:int, param2:int) : void
      {
         removeChild(this._6s);
         this._6s = this._1mf[this._1G_6 + uint(param1 / this._18O_ % this._1__A_)];
         addChild(this._6s);
      }
      
      public function setAnimationDuration(param1:Number) : void
      {
         this._18O_ = param1;
      }
      
      public function setAnimation(param1:Number, param2:Number) : void
      {
         this._1G_6 = param1;
         this._1__A_ = param2;
      }
      
      public function _1U_F_(param1:int) : void
      {
         switch(param1)
         {
            case _1iP_:
               this.setAnimation(0,0);
               this.setAnimationDuration(250);
               return;
            case _10t:
               this.setAnimation(3,3);
               this.setAnimationDuration(10);
               return;
            case _mI_:
               this.setAnimation(6,7);
               this.setAnimationDuration(80);
               return;
            case _0ey:
               this.setAnimation(13,7);
               this.setAnimationDuration(210);
               return;
            case _N_R_:
               this.setAnimation(20,13);
               this.setAnimationDuration(120);
               return;
            default:
               this.setAnimation(13,7);
               return;
         }
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._6s = null;
         this._1mf = null;
      }
   }
}
