package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.filters.ColorMatrixFilter;
   import com.company.util.MoreColorUtil;
   import flash.display.Bitmap;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import flash.geom.Point;
   import _1gF_._0ke;
   import flash.display.BitmapData;
   import com.company.util.GraphicHelper;
   import com.company.util.TextureLibrary;
   import _0H_6.GameContext;
   import _1xa.SText;
   
   public class Slot extends Sprite
   {
      
      public static const _0L_P_:Matrix = new Matrix();
      
      public static const _0H_3:int = 0;
      
      public static const _rW_:int = 1;
      
      public static const _0P_v:int = 2;
      
      public static const _08B_:int = 3;
      
      public static const _0F_t:int = 4;
      
      public static const _06l:int = 5;
      
      public static const _0aQ_:int = 6;
      
      public static const _try:int = 7;
      
      public static const _za:int = 8;
      
      public static const _0D_w:int = 9;
      
      public static const _E_I_:int = 10;
      
      public static const _0oB_:int = 11;
      
      public static const _1J_L_:int = 12;
      
      public static const _1v5:int = 13;
      
      public static const _1S_L_:int = 14;
      
      public static const _1__5:int = 15;
      
      public static const _0T_K_:int = 16;
      
      public static const _4m:int = 17;
      
      public static const _0xa:int = 18;
      
      public static const _0gQ_:int = 19;
      
      public static const _0y0:int = 20;
      
      public static const _0B_9:int = 21;
      
      public static const _Q_V_:int = 22;
      
      public static const _1N_F_:int = 23;
      
      public static const _1F_k:int = 24;
      
      public static const WIDTH:int = 40;
      
      public static const HEIGHT:int = 40;
      
      public static const BORDER:int = 4;
      
      private static const _0____:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._U_W_(3552822));
       
      
      public var type_:int;
      
      public var _133:int;
      
      public var _0c6:Array;
      
      public var _jj:Bitmap;
      
      protected var _W_F_:GraphicsSolidFill;
      
      protected var path_:GraphicsPath;
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public function Slot(param1:int, param2:int, param3:Array)
      {
         this._W_F_ = new GraphicsSolidFill(5526612,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._W_F_,this.path_,GraphicHelper.END_FILL];
         super();
         this.type_ = param1;
         this._133 = param2;
         this._0c6 = param3;
         this._1W_A_();
      }
      
      public static function _9R_(param1:int) : String
      {
         switch(param1)
         {
            case _0H_3:
               return "Any";
            case _rW_:
               return "Sword";
            case _0P_v:
               return "Dagger";
            case _08B_:
               return "Bow";
            case _0F_t:
               return "Tome";
            case _06l:
               return "Shield";
            case _0aQ_:
               return "Leather Armor";
            case _try:
               return "Armor";
            case _za:
               return "Wand";
            case _0D_w:
               return "Accessory";
            case _E_I_:
               return "Potion";
            case _0oB_:
               return "Spell";
            case _1J_L_:
               return "Holy Seal";
            case _1v5:
               return "Cloak";
            case _1S_L_:
               return "Robe";
            case _1__5:
               return "Quiver";
            case _0T_K_:
               return "Helm";
            case _4m:
               return "Staff";
            case _0xa:
               return "Poison";
            case _0gQ_:
               return "Skull";
            case _0y0:
               return "Trap";
            case _0B_9:
               return "Orb";
            case _Q_V_:
               return "Prism";
            case _1N_F_:
               return "Scepter";
            case _1F_k:
               return "Shuriken";
            default:
               return "Invalid Type!";
         }
      }
      
      protected function _01X_(param1:int, param2:int, param3:Boolean) : Point
      {
         var _loc4_:Point = new Point();
         switch(param2)
         {
            case _0D_w:
               _loc4_.x = param1 == 2878?Number(0):Number(-2);
               _loc4_.y = !!param3?Number(-2):Number(0);
               break;
            case _0oB_:
               _loc4_.y = -2;
         }
         return _loc4_;
      }
      
      protected function _1W_A_() : void
      {
         var _loc1_:Point = null;
         var _loc2_:_0ke = null;
         var _loc3_:BitmapData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,this._0c6,this.path_);
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData_);
         switch(this.type_)
         {
            case _0H_3:
               break;
            case _rW_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",48);
               break;
            case _0P_v:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",96);
               break;
            case _08B_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",80);
               break;
            case _0F_t:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",80);
               break;
            case _06l:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",112);
               break;
            case _0aQ_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",0);
               break;
            case _try:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",32);
               break;
            case _za:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",64);
               break;
            case _0D_w:
               _loc3_ = TextureLibrary.getBitmap("lofiObj",44);
               break;
            case _0oB_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",64);
               break;
            case _1J_L_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",160);
               break;
            case _1v5:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",32);
               break;
            case _1S_L_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",16);
               break;
            case _1__5:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",48);
               break;
            case _0T_K_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",96);
               break;
            case _4m:
               _loc3_ = TextureLibrary.getBitmap("lofiObj5",112);
               break;
            case _0xa:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",128);
               break;
            case _0gQ_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",0);
               break;
            case _0y0:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",16);
               break;
            case _0B_9:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",144);
               break;
            case _Q_V_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",176);
               break;
            case _1N_F_:
               _loc3_ = TextureLibrary.getBitmap("lofiObj6",192);
         }
         if(this._jj == null)
         {
            if(_loc3_ != null)
            {
               _loc1_ = this._01X_(-1,this.type_,true);
               this._jj = new Bitmap(_loc3_);
               this._jj.x = BORDER + _loc1_.x;
               this._jj.y = BORDER + _loc1_.y;
               this._jj.scaleX = 4;
               this._jj.scaleY = 4;
               this._jj.filters = [_0____];
               addChild(this._jj);
            }
            else if(this._133 > 0)
            {
               _loc2_ = GameContext.getInjector().getInstance(_0ke);
               _loc3_ = _loc2_.make(new SText(String(this._133)),26,3552822,true,_0L_P_,false);
               this._jj = new Bitmap(_loc3_);
               this._jj.x = WIDTH / 2 - _loc3_.width / 2;
               this._jj.y = HEIGHT / 2 - 18;
               addChild(this._jj);
            }
         }
      }
   }
}
