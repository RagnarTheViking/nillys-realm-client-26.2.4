package _0A_T_
{
   import _P_S_.Command;
   import com.company.assembleegameclient.game.__set;
   
   public class _0wf extends Command
   {
       
      
      [Inject]
      public var model:__set;
      
      [Inject]
      public var _0N_p:Boolean;
      
      public function _0wf()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model._0jw(this._0N_p);
      }
   }
}
