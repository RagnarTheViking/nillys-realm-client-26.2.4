package _T_n
{
   import flash.display.Sprite;
   import com.company.rotmg.graphics.StarGraphic;
   import flash.display.Graphics;
   import flash.geom.ColorTransform;
   
   public class _0p1 extends Sprite
   {
      
      private static const _Z_o:int = 5;
      
      private static const _1n4:int = 4;
      
      private static const _13X_:int = 15;
      
      private static const _0p0:uint = 2434341;
      
      private static const _L_Y_:uint = 8618883;
      
      private static const _vD_:uint = 16777215;
       
      
      private const stars:Vector.<StarGraphic> = this._0mm();
      
      private const background:Sprite = this._1L_c();
      
      public function _0p1()
      {
         super();
      }
      
      private function _0mm() : Vector.<StarGraphic>
      {
         var _loc1_:Vector.<StarGraphic> = this._00e();
         this._1sd(_loc1_);
         return _loc1_;
      }
      
      private function _00e() : Vector.<StarGraphic>
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<StarGraphic> = new Vector.<StarGraphic>(_Z_o,true);
         while(_loc2_ < _Z_o)
         {
            _loc1_[_loc2_] = new StarGraphic();
            addChild(_loc1_[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function _1sd(param1:Vector.<StarGraphic>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < _Z_o)
         {
            param1[_loc2_].x = _1n4 + param1[0].width * _loc2_;
            param1[_loc2_].y = _1n4;
            _loc2_++;
         }
      }
      
      private function _1L_c() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         this._1W_A_(_loc1_.graphics);
         addChildAt(_loc1_,0);
         return _loc1_;
      }
      
      private function _1W_A_(param1:Graphics) : void
      {
         var _loc2_:StarGraphic = this.stars[0];
         var _loc3_:int = _loc2_.width * _Z_o + 2 * _1n4;
         var _loc4_:int = _loc2_.height + 2 * _1n4;
         param1.clear();
         param1.beginFill(_0p0);
         param1.drawRoundRect(0,0,_loc3_,_loc4_,_13X_,_13X_);
         param1.endFill();
      }
      
      public function setStars(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < _Z_o)
         {
            this._final(_loc2_,param1);
            _loc2_++;
         }
      }
      
      private function _final(param1:int, param2:int) : void
      {
         var _loc3_:StarGraphic = this.stars[param1];
         var _loc4_:ColorTransform = _loc3_.transform.colorTransform;
         _loc4_.color = param1 < param2?uint(_vD_):uint(_L_Y_);
         _loc3_.transform.colorTransform = _loc4_;
      }
   }
}
