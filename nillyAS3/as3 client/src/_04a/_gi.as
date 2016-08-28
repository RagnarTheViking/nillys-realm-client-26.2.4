package _04a
{
   import flash.display.LoaderInfo;
   import _ki._yx;
   import _ki._1N_a;
   import _1__8._19A_;
   
   public class _gi implements _0L___
   {
       
      
      [Inject]
      public var info:LoaderInfo;
      
      [Inject]
      public var _0qa:_yx;
      
      [Inject]
      public var _0K_0:_1N_a;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _gi()
      {
         super();
      }
      
      public function _0__r() : String
      {
         return this.info.parameters.kabam_signed_request;
      }
      
      public function _46() : Object
      {
         var signedRequest:String = null;
         var requestDetails:Array = null;
         var payload:String = null;
         var userSession:Object = null;
         signedRequest = this._0__r();
         try
         {
            requestDetails = signedRequest.split(".",2);
            if(requestDetails.length != 2)
            {
               throw new Error("Invalid signed request");
            }
            payload = this._0F_x(requestDetails[1]);
            userSession = this._0qa.parse(payload);
         }
         catch(error:Error)
         {
            _0G_2.info("Failed to get user session: " + error.toString() + ", signed request: " + signedRequest);
            userSession = null;
         }
         return userSession;
      }
      
      protected function _0F_x(param1:String) : String
      {
         var _loc2_:RegExp = /-/g;
         var _loc3_:RegExp = /_/g;
         var _loc4_:int = 4 - param1.length % 4;
         while(_loc4_--)
         {
            param1 = param1 + "=";
         }
         param1 = param1.replace(_loc2_,"+").replace(_loc3_,"/");
         return this._0K_0.decode(param1);
      }
   }
}
