package _0E_n
{
   import flash.display.Sprite;
   
   public class _1X_U_ extends Sprite
   {
       
      
      private var _0P_7:Sprite;
      
      private var _xx:Sprite;
      
      public function _1X_U_()
      {
         super();
      }
      
      public function _kU_(param1:Sprite) : void
      {
         if(this._0P_7 == param1)
         {
            return;
         }
         this._1Q_w();
         this._0P_7 = param1;
         addChild(param1);
      }
      
      private function _1Q_w() : void
      {
         if(this._0P_7 && contains(this._0P_7))
         {
            this._xx = this._0P_7;
            removeChild(this._0P_7);
         }
      }
      
      public function _0yY_() : Sprite
      {
         return this._xx;
      }
   }
}
