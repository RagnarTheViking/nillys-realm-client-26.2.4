package _1V_w
{
   import _1__8._01s;
   import _1I_2._0sG_;
   import _wi.Injector;
   import _1__8._1Q_O_;
   import _1I_2._O_g;
   import _I_w._0S_m;
   
   public class _d6 implements _01s
   {
      
      private static var _08w:_0sG_;
      
      private static var _08O_:uint;
       
      
      private const _0yi:String = _0S_m.create(_d6);
      
      private var _A_A_:Injector;
      
      public function _d6()
      {
         super();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         _08O_++;
         this._A_A_ = param1._T_X_;
         param1._1za._15q(this._15q);
         param1._1za._0O_v(this._0O_v);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _15q() : void
      {
         var _loc1_:_O_g = null;
         if(_08w == null)
         {
            _loc1_ = this._A_A_.getInstance(_O_g);
            _08w = new _0sG_(_loc1_);
         }
      }
      
      private function _0O_v() : void
      {
         _08O_--;
         if(_08O_ == 0)
         {
            _08w.destroy();
            _08w = null;
         }
      }
   }
}
