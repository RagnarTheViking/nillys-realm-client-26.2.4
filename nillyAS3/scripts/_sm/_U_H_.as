package _sm
{
   import _0hJ_._Z___;
   import _0hJ_.Server;
   import _v4.Client;
   import _0hJ_._1ph;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _U_H_ implements _Z___
   {
       
      
      private const servers:Vector.<Server> = new Vector.<Server>(0);
      
      [Inject]
      public var model:Client;
      
      public function _U_H_()
      {
         super();
      }
      
      public function _0cn(param1:Vector.<Server>) : void
      {
         var _loc2_:Server = null;
         this.servers.length = 0;
         for each(_loc2_ in param1)
         {
            this.servers.push(_loc2_);
         }
      }
      
      public function _1Q_t() : Vector.<Server>
      {
         return this.servers;
      }
      
      public function _J_i() : Server
      {
         var _loc1_:Server = null;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc6_:Server = null;
         var _loc4_:Boolean = this.model.isAdmin();
         var _loc5_:_1ph = this.model._sU_();
         var _loc7_:Number = Number.MAX_VALUE;
         var _loc8_:int = int.MAX_VALUE;
         for each(_loc1_ in this.servers)
         {
            if(_loc1_.name == Parameters.data_.preferredServer)
            {
               return _loc1_;
            }
            _loc2_ = _loc1_.priority();
            _loc3_ = _1ph.distance(_loc5_,_loc1_._0f5);
            if(_loc2_ < _loc8_ || _loc2_ == _loc8_ && _loc3_ < _loc7_)
            {
               _loc6_ = _loc1_;
               _loc7_ = _loc3_;
               _loc8_ = _loc2_;
            }
         }
         return _loc6_;
      }
      
      public function _bp() : Boolean
      {
         return this.servers.length > 0;
      }
   }
}
