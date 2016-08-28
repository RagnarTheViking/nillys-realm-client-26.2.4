package _130
{
   import _4u.Account;
   import _aW_.IWebRequest;
   import _2l.ClientSettings;
   import flash.events.ErrorEvent;
   import com.company.util._05j;
   
   public class _149
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var event:ErrorEvent;
      
      private var error;
      
      public function _149()
      {
         super();
      }
      
      public function execute() : void
      {
         this.event.preventDefault();
         this.error = this.event["error"];
         this._02p();
         var _loc1_:Array = [];
         _loc1_.push("Build: " + this.setup.Name());
         _loc1_.push("message: " + this._02p());
         _loc1_.push("stackTrace: " + this.getStackTrace());
         _loc1_.push(_05j._Y_P_());
         this.client._pp(false);
         this.client.sendRequest("/clientError/add",{
            "text":_loc1_.join("\n"),
            "guid":this.account.getUserId()
         });
      }
      
      private function _02p() : String
      {
         if(this.error is Error)
         {
            return this.error.message;
         }
         if(this.event != null)
         {
            return this.event.text;
         }
         if(this.error != null)
         {
            return this.error.toString();
         }
         return "(empty)";
      }
      
      private function getStackTrace() : String
      {
         return this.error is Error?Error(this.error).getStackTrace():"(empty)";
      }
   }
}
