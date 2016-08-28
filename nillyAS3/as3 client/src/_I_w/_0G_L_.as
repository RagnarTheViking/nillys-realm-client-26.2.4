package _I_w
{
   import flash.utils.Dictionary;
   import _0ps._X_L_;
   import _1__8._1Q_O_;
   import _1__8._19A_;
   import _0ps._0__i;
   
   public class _0G_L_
   {
       
      
      private const _0yi:String = _0S_m.create(_0G_L_);
      
      private const _0cT_:Dictionary = new Dictionary(true);
      
      private const _mQ_:_X_L_ = new _0__i();
      
      private var _0S_Z_:_1Q_O_;
      
      private var _1aY_:_19A_;
      
      public function _0G_L_(param1:_1Q_O_)
      {
         super();
         this._0S_Z_ = param1;
         this._1aY_ = this._0S_Z_._A_9(this);
      }
      
      public function _B_5(param1:Object) : void
      {
         var _loc2_:Class = null;
         if(param1 is Class)
         {
            this._0cT_[param1] || this._B_5(new (param1 as Class)());
         }
         else
         {
            _loc2_ = this._mQ_._1V_1(param1);
            if(this._0cT_[_loc2_])
            {
               return;
            }
            this._1aY_.debug("Installing extension {0}",[param1]);
            this._0cT_[_loc2_] = true;
            param1.extend(this._0S_Z_);
         }
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
   }
}
