package _1L___
{
   import _0hJ_._Z___;
   import _0hJ_.Server;
   
   public class _finally
   {
       
      
      [Inject]
      public var servers:_Z___;
      
      [Inject]
      public var data:XML;
      
      public function _finally()
      {
         super();
      }
      
      public function execute() : void
      {
         this.servers._0cn(this._V_h());
      }
      
      private function _V_h() : Vector.<Server>
      {
         var _loc1_:XML = null;
         var _loc2_:XMLList = this.data.child("Servers").child("Server");
         var _loc3_:Vector.<Server> = new Vector.<Server>(0);
         for each(_loc1_ in _loc2_)
         {
            _loc3_.push(this._05s(_loc1_));
         }
         return _loc3_;
      }
      
      private function _05s(param1:XML) : Server
      {
         return new Server().setName(param1.Name).setAddress(param1.DNS).setPort(param1.Port).setLatLong(Number(param1.Lat),Number(param1.Long)).setUsage(param1.Usage).setIsAdminOnly(param1.hasOwnProperty("AdminOnly"));
      }
   }
}
