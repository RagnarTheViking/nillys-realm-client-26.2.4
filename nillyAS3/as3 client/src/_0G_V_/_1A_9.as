package _0G_V_
{
   import _1__8._01s;
   import _wi.Injector;
   import _1__8._19A_;
   import _1__8._1Q_O_;
   import _0wG_.instanceOf;
   import flash.display.DisplayObjectContainer;
   import _I_w._0S_m;
   
   public class _1A_9 implements _01s
   {
       
      
      private const _0yi:String = _0S_m.create(_1A_9);
      
      private var _A_A_:Injector;
      
      private var _1aY_:_19A_;
      
      public function _1A_9()
      {
         super();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         this._A_A_ = param1._T_X_;
         this._1aY_ = param1._A_9(this);
         param1._09l(instanceOf(DisplayObjectContainer),this._10O_);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _10O_(param1:DisplayObjectContainer) : void
      {
         if(this._A_A_._T_c(DisplayObjectContainer))
         {
            this._1aY_._0G_b("A contextView has already been mapped, ignoring {0}",[param1]);
         }
         else
         {
            this._1aY_.debug("Mapping {0} as contextView",[param1]);
            this._A_A_.map(DisplayObjectContainer)._1as(param1);
         }
      }
   }
}
