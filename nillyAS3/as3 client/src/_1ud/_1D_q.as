package _1ud
{
   import Packets.Server.Death;
   import _3b.CloseDialogsSignal;
   import _04e._05X_;
   import _v4.Client;
   
   public class _1D_q
   {
       
      
      [Inject]
      public var death:Death;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var model:_05X_;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var _lg:_1ud._0rV_;
      
      [Inject]
      public var _0J_t:_1ud._08e;
      
      [Inject]
      public var normal:_1ud._1Q_Y_;
      
      public function _1D_q()
      {
         super();
      }
      
      public function execute() : void
      {
         this.closeDialogs.dispatch();
         if(this._0V_J_())
         {
            this._0C_c();
         }
         else
         {
            this._0O_T_();
         }
      }
      
      private function _0V_J_() : Boolean
      {
         return this.model._0z__();
      }
      
      private function _0C_c() : void
      {
         this.normal.dispatch(this.model._1sw());
      }
      
      private function _0O_T_() : void
      {
         this.model._0jO_(this.death);
         if(this.death._0W_1)
         {
            this._0J_t.dispatch(this.death);
         }
         else if(!this.player._C_2())
         {
            this._lg.dispatch(this.death);
         }
         else
         {
            this.normal.dispatch(this.death);
         }
      }
   }
}
