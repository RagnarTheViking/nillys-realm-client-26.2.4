package _G_Z_
{
   import _1ar.Command;
   import _v4.Client;
   import com.company.assembleegameclient.appengine.CharList;
   
   public class _S_j extends Command
   {
       
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var data:XML;
      
      public function _S_j()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model.setCharList(new CharList(this.data));
         this.model._0hW_ = false;
      }
   }
}
