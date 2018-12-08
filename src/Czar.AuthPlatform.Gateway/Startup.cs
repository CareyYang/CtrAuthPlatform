using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Czar.Gateway.Middleware;
using IdentityServer4.AccessTokenValidation;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Ocelot.Administration;
using Ocelot.DependencyInjection;

namespace Czar.AuthPlatform.Gateway
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var authenticationProviderKey = "TestKey";
            Action<IdentityServerAuthenticationOptions> gatewayoptions = o =>
            {
                o.Authority = "http://localhost:6611";
                o.ApiName = "gateway";
                o.RequireHttpsMetadata = false;
            };

            services.AddAuthentication()
                .AddIdentityServerAuthentication(authenticationProviderKey, gatewayoptions);

            Action<IdentityServerAuthenticationOptions> options = o =>
            {
                o.Authority = "http://localhost:6611"; //IdentityServer��ַ
                o.RequireHttpsMetadata = false;
                o.ApiName = "gateway_admin"; //���ع�������ƣ���Ӧ��Ϊ�ͻ�����Ȩ��scope
            };
            services.AddOcelot().AddCzarOcelot(option =>
            {
                option.DbConnectionStrings = Configuration["CzarConfig:DbConnectionStrings"];
                option.RedisConnectionStrings = new List<string>() {        Configuration["CzarConfig:RedisConnectionStrings"]
                };
                //option.EnableTimer = true;//���ö�ʱ����
                //option.TimerDelay = 10 * 000;//����10��
                option.ClientAuthorization = true;
                option.ClientRateLimit = true;
            })
            //.UseMySql()
            .AddAdministration("/CzarOcelot", options);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }
            app.UseCzarOcelot().Wait();
        }
    }
}
