package _0R_R_
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _1T_4._1pn;
   import _1__8._19A_;
   import flash.utils.Timer;
   import flash.net.URLLoaderDataFormat;
   import flash.utils.IDataInput;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.events.TimerEvent;
   
   public class GetServerXmls extends _049
   {
      
      private static const _T_g:int = 1000;
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _0O_o:_1pn;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var _0v2:Timer;
      
      public function GetServerXmls()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.info("GetXmlDataTask start");
         this.sendRequest();
      }
      
      private function sendRequest() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client._gP_(URLLoaderDataFormat.BINARY);
         this.client.sendRequest("/app/getServerXmls",null);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0g5(param2);
         }
         else
         {
            this._0W_S_(param2);
         }
      }
      
      private function _0g5(param1:IDataInput) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._0rq(param1.readUTFBytes(param1.readInt()));
            _loc3_++;
         }
         _0et(true);
         if(this._0v2 != null)
         {
            this._0S_c();
         }
      }
      
      private function _0rq(param1:String) : void
      {
         var _loc2_:XML = XML(param1);
         GroundLibrary.add(_loc2_);
         ObjectLibrary.add(_loc2_);
      }
      
      private function _0W_S_(param1:String) : void
      {
         this._0O_o.dispatch("error.loadError");
         this._0O_Y_();
      }
      
      private function _0O_Y_() : void
      {
         this._0G_2.info("GetXmlDataTask error - retrying");
         this._0v2 = new Timer(_T_g,1);
         this._0v2.addEventListener(TimerEvent.TIMER_COMPLETE,this._W_D_);
         this._0v2.start();
      }
      
      private function _0S_c() : void
      {
         this._0v2.stop();
         this._0v2.removeEventListener(TimerEvent.TIMER_COMPLETE,this._W_D_);
         this._0v2 = null;
      }
      
      private function _W_D_(param1:TimerEvent) : void
      {
         this._0S_c();
         this.sendRequest();
      }
   }
}
