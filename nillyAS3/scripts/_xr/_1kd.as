package _xr
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _ek._18o;
   import _4u.Account;
   import _1__8._19A_;
   import _03U_._51;
   import _3b.DialogSignal;
   import Settings.App;
   import flash.utils.getTimer;
   import _eN_._0M_5;
   import com.company.assembleegameclient.util.TimeConversions;
   import _D_2.MysteryBoxInfo;
   
   public class _1kd extends _049
   {
      
      private static const _N_N_:int = 600;
      
      private static var version:String = "0";
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _1W_9:_xr._0P_R_;
      
      [Inject]
      public var _0V_P_:_18o;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var _jk:_51;
      
      [Inject]
      public var _0K_A_:DialogSignal;
      
      public var _qH_:uint = 0;
      
      public function _1kd()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Object = null;
         if(App.hasProperty("MysteryBoxRefresh"))
         {
            _loc1_ = App.getProperty("MysteryBoxRefresh");
         }
         else
         {
            _loc1_ = _N_N_;
         }
         if(this._qH_ == 0 || this._qH_ + _loc1_ < getTimer() / 1000)
         {
            this._qH_ = getTimer() / 1000;
            _0et(true);
            _loc2_ = this.account.credentials();
            _loc2_.language = this._jk._lP_();
            _loc2_.version = version;
            this.client.sendRequest("/mysterybox/getBoxes",_loc2_);
            this.client.complete.addOnce(this.onComplete);
         }
         else
         {
            _0et(true);
            reset();
         }
      }
      
      public function _1B_2() : void
      {
         this._qH_ = 0;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         reset();
         if(param1)
         {
            this._0r__(param2);
         }
         else
         {
            this._0G_2._0G_b("GetPackageTask.onComplete: Request failed.");
            _0et(false);
         }
      }
      
      private function _0r__(param1:*) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:XMLList = null;
         if(this._0T_m(param1))
         {
            if(this._1W_9.isInitialized())
            {
               return;
            }
            this._1W_9.setInitialized(false);
         }
         else
         {
            version = XML(param1).attribute("version").toString();
            _loc2_ = XML(param1).child("MysteryBox");
            this.parse(_loc2_);
            _loc3_ = XML(param1).child("FortuneGame");
            if(_loc3_.length() > 0)
            {
               this._0L_J_(_loc3_);
            }
         }
         _0et(true);
      }
      
      private function _0T_m(param1:*) : Boolean
      {
         var _loc2_:XMLList = XML(param1).children();
         return _loc2_.length() == 0;
      }
      
      private function _0L_J_(param1:XMLList) : void
      {
         var _loc2_:_0M_5 = new _0M_5();
         _loc2_.id = param1.attribute("id").toString();
         _loc2_.title = param1.attribute("title").toString();
         _loc2_.weight = param1.attribute("weight").toString();
         _loc2_.description = param1.Description.toString();
         _loc2_._0j2 = param1.Contents.toString();
         _loc2_._1k7 = param1.Price.attribute("firstInGold").toString();
         _loc2_._qL_ = param1.Price.attribute("firstInToken").toString();
         _loc2_._0pY_ = param1.Price.attribute("secondInGold").toString();
         _loc2_._09I_ = param1.Icon.toString();
         _loc2_._0jC_ = param1.Image.toString();
         _loc2_.startTime = TimeConversions.dateStringToDate(param1.StartTime.toString());
         _loc2_.endTime = TimeConversions.dateStringToDate(param1.EndTime.toString());
         _loc2_._0iO_();
         this._0V_P_._0L_7(_loc2_);
      }
      
      private function parse(param1:XMLList) : void
      {
         var _loc2_:XML = null;
         var _loc3_:MysteryBoxInfo = null;
         var _loc5_:Boolean = false;
         var _loc4_:Array = [];
         for each(_loc2_ in param1)
         {
            _loc3_ = new MysteryBoxInfo();
            _loc3_.id = _loc2_.attribute("id").toString();
            _loc3_.title = _loc2_.attribute("title").toString();
            _loc3_.weight = _loc2_.attribute("weight").toString();
            _loc3_.description = _loc2_.Description.toString();
            _loc3_._0j2 = _loc2_.Contents.toString();
            _loc3_._1P_G_ = _loc2_.Price.attribute("amount").toString();
            _loc3_._0Z_E_ = _loc2_.Price.attribute("currency").toString();
            if(_loc2_.hasOwnProperty("Sale"))
            {
               _loc3_._0__l = _loc2_.Sale.attribute("price").toString();
               _loc3_._G_5 = _loc2_.Sale.attribute("currency").toString();
               _loc3_._0V_d = TimeConversions.dateStringToDate(_loc2_.Sale.End.toString());
            }
            _loc3_._09I_ = _loc2_.Icon.toString();
            _loc3_._0jC_ = _loc2_.Image.toString();
            _loc3_.startTime = TimeConversions.dateStringToDate(_loc2_.StartTime.toString());
            _loc3_._0iO_();
            if(!_loc5_ && (_loc3_.isNew() || _loc3_._0tF_()))
            {
               _loc5_ = true;
            }
            _loc4_.push(_loc3_);
         }
         this._1W_9._U_J_(_loc4_);
         this._1W_9.isNew = _loc5_;
      }
   }
}
