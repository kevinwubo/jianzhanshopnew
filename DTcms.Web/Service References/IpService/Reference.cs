﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18408
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace DTcms.Web.IpService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://WebXml.com.cn/", ConfigurationName="IpService.IpAddressSearchWebServiceSoap")]
    public interface IpAddressSearchWebServiceSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://WebXml.com.cn/getCountryCityByIp", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string[] getCountryCityByIp(string theIpAddress);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://WebXml.com.cn/getGeoIPContext", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string[] getGeoIPContext();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://WebXml.com.cn/getVersionTime", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        string getVersionTime();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IpAddressSearchWebServiceSoapChannel : DTcms.Web.IpService.IpAddressSearchWebServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class IpAddressSearchWebServiceSoapClient : System.ServiceModel.ClientBase<DTcms.Web.IpService.IpAddressSearchWebServiceSoap>, DTcms.Web.IpService.IpAddressSearchWebServiceSoap {
        
        public IpAddressSearchWebServiceSoapClient() {
        }
        
        public IpAddressSearchWebServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public IpAddressSearchWebServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public IpAddressSearchWebServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public IpAddressSearchWebServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string[] getCountryCityByIp(string theIpAddress) {
            return base.Channel.getCountryCityByIp(theIpAddress);
        }
        
        public string[] getGeoIPContext() {
            return base.Channel.getGeoIPContext();
        }
        
        public string getVersionTime() {
            return base.Channel.getVersionTime();
        }
    }
}
