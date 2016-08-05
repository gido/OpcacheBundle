<?php

namespace Sixdays\OpcacheBundle\DependencyInjection;

use Symfony\Component\Config\Definition\Processor;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class SixdaysOpcacheExtension extends Extension
{
    public function load(array $configs, ContainerBuilder $container)
    {
        $processor = new Processor();
        $configuration = new Configuration();
        $config = $processor->process($configuration->getConfigTree(), $configs);

        $container->setParameter('sixdays_opcache.base_url', $config['base_url']);
        $container->setParameter('sixdays_opcache.web_dir', $config['web_dir']);

        $container->setParameter('sixdays_opcache.http_basic.user', null);
        $container->setParameter('sixdays_opcache.http_basic.password', null);

        if (isset($config['http_basic']) && null !== $config['http_basic']['user']) {
            $container->setParameter('sixdays_opcache.http_basic.user', $config['http_basic']['user']);
            $container->setParameter('sixdays_opcache.http_basic.password', $config['http_basic']['password']);
        }
    }
}
