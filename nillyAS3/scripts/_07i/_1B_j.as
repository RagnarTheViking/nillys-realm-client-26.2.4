package _07i
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _v4.Client;
   import _04m._kN_;
   import _04m._1__O_;
   import _04m.Timespan;
   import _04m._0dn;
   
   public class _1B_j extends _049
   {
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var model:_kN_;
      
      [Inject]
      public var factory:_1__O_;
      
      [Inject]
      public var timespan:Timespan;
      
      public var charId:int;
      
      public function _1B_j()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/fame/list",this._1D_2());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._10N_(param2);
         _0et(param1,param2);
      }
      
      private function _10N_(param1:String) : void
      {
         var _loc2_:Vector.<_0dn> = this.factory._0X_7(XML(param1));
         this.model._1T_6(_loc2_);
      }
      
      private function _1D_2() : Object
      {
         var _loc1_:Object = {};
         _loc1_.timespan = this.timespan._031();
         _loc1_.accountId = this.player.getAccountId();
         _loc1_.charId = this.charId;
         return _loc1_;
      }
   }
}
