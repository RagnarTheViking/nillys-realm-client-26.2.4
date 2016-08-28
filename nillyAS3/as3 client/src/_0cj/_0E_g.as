package _0cj
{
   import _0f._1F_b;
   import _0nd._09u;
   import _I_w._1W_1;
   import _1W_F_._15u;
   
   public class _0E_g implements _1F_b, _09u
   {
       
      
      private var _vn:Boolean = false;
      
      private var _X_C_:_1W_1;
      
      private var _matcher:_15u;
      
      private var _0qV_:Class;
      
      private var _1X_4:Array;
      
      private var _1mk:Array;
      
      public function _0E_g(param1:_15u, param2:Class)
      {
         this._1X_4 = [];
         this._1mk = [];
         super();
         this._matcher = param1;
         this._0qV_ = param2;
      }
      
      public function get _0az() : _15u
      {
         return this._matcher;
      }
      
      public function get _0R_u() : Class
      {
         return this._0qV_;
      }
      
      public function get _P_O_() : Array
      {
         return this._1X_4;
      }
      
      public function get _1P_S_() : Array
      {
         return this._1mk;
      }
      
      public function _1qt(... rest) : _09u
      {
         this._X_C_ && this._X_C_._0E_q(rest);
         this._1X_4 = this._1X_4.concat.apply(null,rest);
         return this;
      }
      
      public function _1xT_(... rest) : _09u
      {
         this._X_C_ && this._X_C_._1Y_q(rest);
         this._1mk = this._1mk.concat.apply(null,rest);
         return this;
      }
      
      function _11v() : void
      {
         if(this._X_C_)
         {
            this._X_C_._11v();
         }
         else
         {
            this._X_9();
         }
         this._1X_4 = [];
         this._1mk = [];
      }
      
      public function _df() : void
      {
         if(!this._X_C_)
         {
            this._X_9();
         }
         else if(!this._X_C_._17L_)
         {
            this._X_C_._df(this._1X_4,this._1mk);
         }
      }
      
      private function _X_9() : void
      {
         this._X_C_ = new _1W_1(this._1X_4.slice(),this._1mk.slice(),this._matcher,this._0qV_);
      }
   }
}
