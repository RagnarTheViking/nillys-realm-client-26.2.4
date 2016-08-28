package _130
{
   import _1__8._19A_;
   import flash.events.ErrorEvent;
   
   public class _01K_
   {
       
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var event:ErrorEvent;
      
      public function _01K_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0G_2.error(this.event.text);
         if(this.event["error"] && this.event["error"] is Error)
         {
            this._bn(this.event["error"]);
         }
      }
      
      private function _bn(param1:Error) : void
      {
         this._0G_2.error(param1.message);
         this._0G_2.error(param1.getStackTrace());
      }
   }
}
