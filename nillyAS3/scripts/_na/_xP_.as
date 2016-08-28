package _na
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _1lY_._1du;
   import _04h._11o;
   import _04h._083;
   import com.company.util._l5;
   
   public class _xP_ extends _049
   {
      
      private static const _tY_:String = "arena/getRecords";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var factory:_na._0F_a;
      
      [Inject]
      public var _Y_L_:_1du;
      
      public var filter:_11o;
      
      public function _xP_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest(_tY_,this._1D_2());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._1lT_(param2);
         _0et(param1,param2);
      }
      
      private function _1lT_(param1:String) : void
      {
         var _loc2_:Vector.<_083> = this.factory._1yi(XML(param1).Record);
         this.filter._wv(_loc2_);
         this._Y_L_.dispatch();
      }
      
      private function _1D_2() : Object
      {
         var _loc1_:Object = {"type":this.filter.getKey()};
         _l5._0an(_loc1_,this.account.credentials());
         return _loc1_;
      }
   }
}
