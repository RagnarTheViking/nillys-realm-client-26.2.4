package _1C_p
{
   import _1E_7._7p;
   import _1E_7._0zq;
   import _4u.Account;
   import _bv._X_r;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class News
   {
      
      private static const COUNT:int = 3;
      
      public static const _1T_e:int = 4;
       
      
      [Inject]
      public var update:_7p;
      
      [Inject]
      public var _02t:_0zq;
      
      [Inject]
      public var account:Account;
      
      public var news:Vector.<_1C_p._16E_>;
      
      public var _1__t:Vector.<_X_r>;
      
      public var _035:Vector.<_1C_p._16E_>;
      
      public function News()
      {
         super();
      }
      
      public function _9g() : void
      {
         var _loc1_:int = 0;
         this.news = new Vector.<_1C_p._16E_>(COUNT,true);
         while(_loc1_ < COUNT)
         {
            this.news[_loc1_] = new _1eQ_(_loc1_);
            _loc1_++;
         }
      }
      
      public function _10x(param1:Vector.<_1C_p._16E_>) : void
      {
         var _loc2_:_1C_p._16E_ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._9g();
         var _loc5_:Vector.<_1C_p._16E_> = new Vector.<_1C_p._16E_>();
         this._035 = new Vector.<_1C_p._16E_>(4,true);
         for each(_loc2_ in param1)
         {
            if(_loc2_.slot <= 3)
            {
               _loc5_.push(_loc2_);
            }
            else
            {
               _loc3_ = _loc2_.slot - 4;
               _loc4_ = _loc3_ + 1;
               this._035[_loc3_] = _loc2_;
               if(Parameters.data_["newsTimestamp" + _loc4_] != _loc2_._0ma)
               {
                  Parameters.data_["newsTimestamp" + _loc4_] = _loc2_._0ma;
                  Parameters.data_["hasNewsUpdate" + _loc4_] = true;
               }
            }
         }
         this._Y_S_(_loc5_);
         this.update.dispatch(this.news);
         this._02t.dispatch();
      }
      
      public function _jl() : Boolean
      {
         return this.news[0] != null && this.news[1] != null && this.news[2] != null;
      }
      
      public function hasItems() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < _1T_e)
         {
            if(this._035[_loc1_] == null)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function _Y_S_(param1:Vector.<_1C_p._16E_>) : void
      {
         var _loc2_:_1C_p._16E_ = null;
         for each(_loc2_ in param1)
         {
            if(this._B_L_(_loc2_) && this._1t4(_loc2_))
            {
               this._gD_(_loc2_);
            }
         }
      }
      
      private function _gD_(param1:_1C_p._16E_) : void
      {
         var _loc2_:uint = param1.slot - 1;
         if(this.news[_loc2_])
         {
            param1 = this._lv(this.news[_loc2_],param1);
         }
         this.news[_loc2_] = param1;
      }
      
      private function _lv(param1:_1C_p._16E_, param2:_1C_p._16E_) : _1C_p._16E_
      {
         return param1.priority < param2.priority?param1:param2;
      }
      
      private function _B_L_(param1:_1C_p._16E_) : Boolean
      {
         var _loc2_:Number = new Date().getTime();
         return param1._0Q_W_ < _loc2_ && _loc2_ < param1._0ma;
      }
      
      public function _F_s() : void
      {
         var _loc1_:int = 0;
         if(!this.hasItems())
         {
            return;
         }
         this._1__t = new Vector.<_X_r>(_1T_e,true);
         while(_loc1_ < _1T_e)
         {
            this._1__t[_loc1_] = new _X_r((this._035[_loc1_] as _1C_p._16E_)._H_b,(this._035[_loc1_] as _1C_p._16E_).linkDetail);
            _loc1_++;
         }
      }
      
      public function _1qO_(param1:int) : _X_r
      {
         if(this._1__t != null && param1 > 0 && param1 <= this._1__t.length && this._1__t[param1 - 1] != null)
         {
            return this._1__t[param1 - 1];
         }
         return new _X_r("No new information","Please check back later.");
      }
      
      private function _1t4(param1:_1C_p._16E_) : Boolean
      {
         var _loc2_:String = this.account._L_y();
         return param1._0O_b.indexOf(_loc2_) != -1;
      }
   }
}
