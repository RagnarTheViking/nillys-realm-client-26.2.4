package _sm
{
   import _0hJ_._Z___;
   import _0hJ_.Server;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _1hb implements _Z___
   {
       
      
      private var localhost:Server;
      
      public function _1hb()
      {
         super();
         this.localhost = new Server().setName("localhost").setPort(Parameters.Port);
      }
      
      public function setIP(param1:String) : _1hb
      {
         this.localhost.setAddress(param1);
         return this;
      }
      
      public function _1Q_t() : Vector.<Server>
      {
         return new <Server>[this.localhost];
      }
      
      public function _J_i() : Server
      {
         return this.localhost;
      }
      
      public function _bp() : Boolean
      {
         return true;
      }
      
      public function _0cn(param1:Vector.<Server>) : void
      {
      }
   }
}
