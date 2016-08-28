package _W_Q_
{
   import flash.display.Sprite;
   import _v4.Client;
   import com.company.assembleegameclient.appengine._0H_o;
   
   public class _1P_W_ extends Sprite
   {
       
      
      private var _0X_1:Vector.<_W_Q_._oG_>;
      
      private var _05J_:Boolean = false;
      
      public function _1P_W_(param1:Client)
      {
         var _loc2_:_0H_o = null;
         this._0X_1 = new Vector.<_W_Q_._oG_>();
         super();
         for each(_loc2_ in param1._I_p())
         {
            if(_loc2_._0xH_())
            {
               this._1wt(new _W_Q_._oG_(_loc2_.getIcon(),_loc2_._00M_,_loc2_._mp,_loc2_._nT_,_loc2_._66,param1.getAccountId()));
               this._05J_ = true;
            }
         }
      }
      
      public function _N_E_() : Boolean
      {
         return this._05J_;
      }
      
      public function _1wt(param1:_W_Q_._oG_) : void
      {
         param1.y = 4 + this._0X_1.length * (_W_Q_._oG_.HEIGHT + 4);
         this._0X_1.push(param1);
         addChild(param1);
      }
   }
}
