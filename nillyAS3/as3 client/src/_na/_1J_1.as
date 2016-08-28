package _na
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _04h._1L_l;
   
   public class _1J_1 extends _049
   {
      
      private static const _tY_:String = "arena/getPersonalBest";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _033:_1L_l;
      
      public function _1J_1()
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
         param1 && this._N_0(param2);
         _0et(param1,param2);
      }
      
      private function _N_0(param1:String) : void
      {
         var _loc2_:XML = XML(param1);
         this._033._0P_9.arenaTime = _loc2_.Record.Time;
         this._033._0P_9.arenaWave = _loc2_.Record.WaveNumber;
      }
      
      private function _1D_2() : Object
      {
         return this.account.credentials();
      }
   }
}
