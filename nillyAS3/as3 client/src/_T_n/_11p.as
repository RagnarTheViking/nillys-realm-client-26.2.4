package _T_n
{
   import flash.display.Sprite;
   import _1un._0r7;
   import _f7.Signal;
   
   public class _11p extends Sprite implements _0r7
   {
      
      public static const WIDTH:int = 20;
      
      public static const BEVEL:int = 4;
      
      public static const _0ci:int = 0;
       
      
      public const _1A_Z_:_0to = new _0to();
      
      public const _0wu:_1yL_ = new _1yL_();
      
      private var _4j:Signal;
      
      private var position:Number = 0;
      
      private var range:int;
      
      private var _1J_h:Number;
      
      private var isEnabled:Boolean = true;
      
      public function _11p()
      {
         super();
         addChild(this._1A_Z_);
         addChild(this._0wu);
         this._1f1();
      }
      
      public function get _d2() : Signal
      {
         return this._4j = this._4j || new Signal(Number);
      }
      
      public function _L_X_() : Boolean
      {
         return this.isEnabled;
      }
      
      public function _1E_k(param1:Boolean) : void
      {
         if(this.isEnabled != param1)
         {
            this.isEnabled = param1;
            if(param1)
            {
               this._1f1();
            }
            else
            {
               this._N_b();
            }
         }
      }
      
      private function _1f1() : void
      {
         this._1A_Z_._1f1();
         this._1A_Z_.clicked.add(this._0rE_);
         this._0wu._1f1();
         this._0wu._4b.add(this._0J_X_);
      }
      
      private function _N_b() : void
      {
         this._1A_Z_._N_b();
         this._1A_Z_.clicked.remove(this._0rE_);
         this._0wu._N_b();
         this._0wu._4b.remove(this._0J_X_);
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this._0wu.rect.height = param1;
         this._1A_Z_.rect.height = param2;
         this.range = param2 - param1 - _0ci * 2;
         this._1J_h = 1 / this.range;
         this._1A_Z_.redraw();
         this._0wu.redraw();
         this.setPosition(this._ja());
      }
      
      public function _0J_w() : int
      {
         return this._0wu.rect.height;
      }
      
      public function _0C_B_() : int
      {
         return this._1A_Z_.rect.height;
      }
      
      public function _ja() : Number
      {
         return this.position;
      }
      
      public function setPosition(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         this.position = param1;
         this._0wu.y = _0ci + this.range * this.position;
         this._4j && this._4j.dispatch(this.position);
      }
      
      private function _0J_X_(param1:int) : void
      {
         this.setPosition((param1 - _0ci) * this._1J_h);
      }
      
      private function _0rE_(param1:int) : void
      {
         var _loc2_:int = this._0wu.rect.height;
         var _loc3_:int = param1 - _loc2_ * 0.5;
         var _loc4_:int = this._1A_Z_.rect.height - _loc2_;
         this.setPosition(_loc3_ / _loc4_);
      }
   }
}
