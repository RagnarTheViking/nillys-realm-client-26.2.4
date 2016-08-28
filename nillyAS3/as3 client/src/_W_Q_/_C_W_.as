package _W_Q_
{
   import flash.display.Sprite;
   import _v4.Client;
   import flash.display.Shape;
   import flash.display.Graphics;
   import com.company.assembleegameclient.screens.charrects.CharacterRectList;
   
   public class _C_W_ extends Sprite
   {
      
      public static const WIDTH:int = 760;
      
      public static const HEIGHT:int = 415;
      
      public static const _0C_f:int = 1;
      
      public static const _1jm:int = 2;
       
      
      public var _R_8:Sprite;
      
      public function _C_W_(param1:Client, param2:int)
      {
         var _loc3_:Shape = null;
         var _loc4_:Graphics = null;
         super();
         switch(param2)
         {
            case _0C_f:
               this._R_8 = new CharacterRectList();
               break;
            case _1jm:
               this._R_8 = new _1P_W_(param1);
               break;
            default:
               this._R_8 = new Sprite();
         }
         addChild(this._R_8);
         if(height > 400)
         {
            _loc3_ = new Shape();
            _loc4_ = _loc3_.graphics;
            _loc4_.beginFill(0);
            _loc4_.drawRect(0,0,WIDTH,HEIGHT);
            _loc4_.endFill();
            addChild(_loc3_);
            mask = _loc3_;
         }
      }
      
      public function _1mX_(param1:Number) : void
      {
         this._R_8.y = param1;
      }
   }
}
